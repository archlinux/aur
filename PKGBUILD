# Maintainer: Edgar <Edgar{at}AnotherFoxGuy.com>
# Contributor: gtmanfred
# Contributor: Gene Ruebsamen <ruebsamen.gene@gmail.com>
# Contributor: Jose Riha <jose1711 gmail com>

pkgname=socketw
pkgver=3.11.0
pkgrel=1
pkgdesc="a cross platform streaming socket C++ library"
arch=('i686' 'x86_64')
url="http://rigsofrods.github.io/socketw/"
depends=('openssl')
license=('GPL-2')
source=("https://github.com/RigsOfRods/socketw/archive/${pkgver}.tar.gz")
sha512sums=('de873c01e0f219c3fbc0630a685843677ec827dd1055f6949bcb942082305caeb7a2cfcf125d49901db784ff4226b200da1f8a59585270d20b70fa7a5a96a29c')

build() {
    cd $srcdir/socketw-${pkgver}

    cmake . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release

    make
}

package() {
    cd $srcdir/socketw-${pkgver}
    make DESTDIR=${pkgdir} install
}
