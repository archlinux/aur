# Maintainer: Michał Walenciak <kicer86@gmail.com>
pkgname=photobroom
pkgver=1.0.0
pkgrel=1
pkgdesc="Photos managing tool"
arch=('i686' 'x86_64')
url="https://github.com/Kicer86/photobroom"
license=('GPL3')
groups=()
depends=('qt5-base' 'exiv2')
makedepends=('cmake' 'libkexiv2' 'boost' 'openlibrary' 'qt5-tools')
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
md5sums=('19d10c6f2474ff4f93de3524920ccf50')

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
