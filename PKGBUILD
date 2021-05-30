# Maintainer: Michał Walenciak <kicer86@gmail.com>
pkgname=openlibrary
pkgver=2.4.0
pkgrel=1
pkgdesc="Set of various toolkits"
arch=('i686' 'x86_64')
url="https://github.com/Kicer86/openlibrary"
license=('LGPL3')
groups=()
depends=('qt6-base')
makedepends=('cmake')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://codeload.github.com/Kicer86/$pkgname/tar.gz/v$pkgver)
noextract=()
md5sums=('7fecbf760a2853ffde852aa8c3432c6d')

build()
{
    cd "$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package()
{
    cd "$pkgname-$pkgver"
    cd build
    make DESTDIR="$pkgdir/" install
}
