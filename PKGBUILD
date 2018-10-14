# Maintainer: Marc Cousin <cousinmarc@gmail.com>
pkgname=algobox
pkgver=1.0.2
pkgrel=1
pkgdesc="Algorithmic learning for high school students"
url="http://www.xm1math.net/algobox/index.html"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('qt5-base' 'qt5-webkit' 'qt5-webengine')
optdepends=()
makedepends=()
source=("http://www.xm1math.net/algobox/${pkgname}-${pkgver}.tar.bz2"
       )
md5sums=('c89783eaf926e67b570d37f87ab94c05')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/../qbuttongroup.patch"
}

build() {
	  cd "${srcdir}/${pkgname}-${pkgver}"
    qmake
	  make
}

package() {
	  cd "${srcdir}/${pkgname}-${pkgver}"
	    make INSTALL_ROOT="${pkgdir}" install
#	      install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
