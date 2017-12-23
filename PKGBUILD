# Maintainer: Michał Walenciak <kicer86@gmail.com>
pkgname=openlibrary
pkgver=2.2.0
pkgrel=2
pkgdesc="Set of various toolkits"
arch=('i686' 'x86_64')
url="https://github.com/Kicer86/openlibrary"
license=('LGPL3')
groups=()
depends=('qt5-base')
makedepends=('boost' 'cmake')
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
md5sums=('c6bcbd298538533bf5063f1428331756')

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
