# Maintainer:  Novikov Maxim <the.mlex@gmail.com>

pkgname=phalcon-devtools
pkgver=5.0.0
pkgrel=1
pkgdesc="This tools provide you useful scripts to generate code helping to develop faster and easy applications that use with Phalcon framework."
arch=('x86_64' 'i686')
license=('BSD')
depends=('php' 'php-phalcon>=5.0.0')
url="https://github.com/phalcon/phalcon-devtools"
makedepends=('composer')
provides=('phalcon-devtools')
install=.INSTALL
source=("https://github.com/phalcon/phalcon-devtools/archive/5.0.x.tar.gz")
sha256sums=('SKIP')

package() {
  # Install
  install -d -m 755 ${pkgdir}/opt/
  mv ${srcdir}/phalcon-devtools-5.0.x $pkgdir/opt/${pkgname}
  cd $pkgdir/opt/${pkgname} && COMPOSER_ALLOW_SUPERUSER=1 composer install --prefer-dist --ignore-platform-reqs --no-dev
}
