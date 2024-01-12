# Maintainer: Michał Walenciak <kicer86@gmail.com>
pkgname=media-downloader
pkgver=4.2.0
pkgrel=2
pkgdesc="This project is a Qt/C++ based frontend to youtube-dl and it can be used to download any media file supported by youtube-dl"
arch=('i686' 'x86_64')
url="https://github.com/mhogomchungu/media-downloader"
license=('GPL2')
groups=()
depends=('qt5-base')
makedepends=('cmake')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"{,.asc})
noextract=()
sha256sums=('3380f00f67818ed42402325ca021f4998b926838fa6306eedbe24c927f3a94d2'
            'SKIP')
validpgpkeys=('6855E493B5B2DF96E319BB6D16E2E1ACC6F51242') # Francis Banyikwa (A key for signing packages) <banyikwafb@gmail.com>

build()
{
    cd $pkgname-$pkgver
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None -Wno-dev ..
    make
}

package()
{
    cd "$pkgname-$pkgver"
    cd build
    make DESTDIR="$pkgdir/" install
}
