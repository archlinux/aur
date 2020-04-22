# Maintainer:  Novikov Maxim <the.mlex@gmail.com>

pkgname=phalcon-devtools
pkgver=4.0.2
pkgrel=1
pkgdesc="This tools provide you useful scripts to generate code helping to develop faster and easy applications that use with Phalcon framework."
arch=('x86_64' 'i686')
license=('BSD')
depends=('php' 'php-phalcon>=3.4.0')
url="https://github.com/phalcon/phalcon-devtools"
makedepends=('composer')
provides=('phalcon-devtools')
install=.INSTALL
source=("https://github.com/phalcon/phalcon-devtools/archive/v${pkgver}.tar.gz")
sha256sums=('7ccf2aac747e21b61ab0fb9994ca3e303fe50d4c6fd8e27ff5bc05c4722c0b80')

package() {
  tar -xvzf ${srcdir}/v${pkgver}.tar.gz
  	
  # Install
  install -d -m 755 ${pkgdir}/opt/
  mv ${srcdir}/phalcon-devtools-${pkgver} $pkgdir/opt/${pkgname}
  cd $pkgdir/opt/${pkgname} && composer install --prefer-dist
}
