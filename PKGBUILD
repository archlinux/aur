# Maintainer: Michał Walenciak <kicer86@gmail.com>
pkgname=openblok
pkgver=0.7.0
pkgrel=2
pkgdesc="A customizable, cross platform, open-source falling block game, packed with a bunch of features."
arch=('i686' 'x86_64')
url="https://github.com/mmatyas/openblok"
license=('GPL3')
groups=()
depends=()
makedepends=('cmake')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://codeload.github.com/mmatyas/$pkgname/tar.gz/v$pkgver)
noextract=()
md5sums=('0c82fadc6573e4fa0fe84171d169d978')

build()
{
    cd "$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DEXEDIR=/usr/bin
    make
}

package()
{
    cd "$pkgname-$pkgver"
    cd build
    make DESTDIR="$pkgdir/" install
}
