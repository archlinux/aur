# Maintainer:  Novikov Maxim <the.mlex@gmail.com>

pkgname=phalcon-devtools
pkgver=4.2.0
pkgrel=1
pkgdesc="This tools provide you useful scripts to generate code helping to develop faster and easy applications that use with Phalcon framework."
arch=('x86_64' 'i686')
license=('BSD')
depends=('php' 'php-phalcon>=4.0.0')
url="https://github.com/phalcon/phalcon-devtools"
makedepends=('composer')
provides=('phalcon-devtools')
install=.INSTALL
source=("https://github.com/phalcon/phalcon-devtools/archive/v${pkgver}.tar.gz")
sha256sums=('e012177de655468ef884a72ff31c9db681fbe418513670608a17ff177e080d8c')

package() {
  tar -xvzf ${srcdir}/v${pkgver}.tar.gz
  	
  # Install
  install -d -m 755 ${pkgdir}/opt/
  mv ${srcdir}/phalcon-devtools-${pkgver} $pkgdir/opt/${pkgname}
  cd $pkgdir/opt/${pkgname} && COMPOSER_ALLOW_SUPERUSER=1 composer install --prefer-dist --ignore-platform-reqs --no-dev
}
