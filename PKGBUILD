# Maintainer: Edgar <Edgar{at}AnotherFoxGuy.com>
# Contributor: gtmanfred
# Contributor: Gene Ruebsamen <ruebsamen.gene@gmail.com>
# Contributor: Jose Riha <jose1711 gmail com>

pkgname=socketw
pkgver=3.10.27
pkgrel=1
pkgdesc="a cross platform streaming socket C++ library"
arch=('i686' 'x86_64')
url="http://rigsofrods.github.io/socketw/"
depends=('openssl')
license=('GPL-2')
source=("https://github.com/RigsOfRods/socketw/archive/${pkgver}.tar.gz")
sha512sums=('2434e4e3ccb8a93a8fc08ca42e3af0b2e3ba420043b290c4b3f23c14f172e4cdc6a7f32e8abfaa11ecc0adc7f864ea07d03e444c62a286a83b62077a8b05673e')

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
