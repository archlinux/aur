# Maintainer: Michał Walenciak <kicer86@gmail.com>
pkgname=photobroom
pkgver=1.1.1
pkgrel=1
pkgdesc="Photos managing tool"
arch=('i686' 'x86_64')
url="https://github.com/Kicer86/photobroom"
license=('GPL3')
groups=()
depends=('jsoncpp' 'openlibrary' 'qt5-base')
makedepends=('boost' 'cmake' 'easyexif' 'jsoncpp' 'openlibrary' 'qt5-tools')
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
md5sums=('c72a9025f7f59a2d78d403bc07f9e0fe')

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
