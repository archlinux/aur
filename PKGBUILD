# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=php-propro
pkgver=2.0.1
pkgrel=1
pkgdesc="Property proxy"
arch=('i686' 'x86_64')
license=('BSD')
url="https://mdref.m6w6.name/propro"
depends=('php')
source=("https://pecl.php.net/get/propro-2.0.1.tgz")
md5sums=('19f9517210a87e18cc09faed262e1522')

build() {
  cd "${srcdir}/propro-${pkgver}"

  phpize
  ./configure
  make
}

package() {
  cd "${srcdir}/propro-${pkgver}"

  make install INSTALL_ROOT="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
