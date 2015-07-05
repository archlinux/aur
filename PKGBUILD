# Maintainer: Markus Härer <markus.haerer@gmx.net>
pkgname=atpdec
pkgver=1.7
pkgrel=1
pkgdesc="a command line NOAA POES weather satellite image software decoder"
arch=('i686' 'x86_64')
url="http://atpdec.sourceforge.net/"
license=('GPL')
depends=('libsndfile' 'libpng')
source=(http://downloads.sourceforge.net/project/atpdec/atpdec%20sources/1.7/$pkgname-$pkgver.tar.gz)
md5sums=('7b800eb8366c7271c99da3f70cda812b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make || return 1
}

package() {  
  mkdir -p "${pkgdir}/usr/bin"
  cd "${srcdir}/${pkgname}-${pkgver}"
  mv atpdec "${pkgdir}/usr/bin/"
}

