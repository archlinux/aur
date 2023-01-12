# Maintainer: Michał Walenciak <kicer86@gmail.com>
pkgname=media-downloader
pkgver=2.8.0
pkgrel=1
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
source=(https://codeload.github.com/mhogomchungu/$pkgname/tar.gz/$pkgver)
noextract=()
md5sums=('829d9750e53633fe8456526319aa9d9a')

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
