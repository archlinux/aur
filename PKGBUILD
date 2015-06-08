# Maintainer: Michał Walenciak <kicer86@gmail.com>
pkgname=openlibrary
pkgver=2.0.0
pkgrel=3
pkgdesc="Set of various toolkits"
arch=('i686' 'x86_64')
url="https://github.com/Kicer86/openlibrary"
license=('LGPL3')
groups=()
depends=('qt5-base')
makedepends=('flex' 'bison' 'boost' 'cmake')
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
md5sums=('e4a0572c2c65504876e5a77bead87f4e')

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
