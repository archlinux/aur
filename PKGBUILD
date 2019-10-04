# Maintainer: Michael Clayfield <me@michaelclayfield.com>

pkgname=icingaweb2-module-incubator
pkgver=0.5.0
pkgrel=1
pkgdesc="Bleeding edge libraries useful for Icinga Web 2 modules"
license=('GPL')
arch=('any')
depends=('icingaweb2' 'icingaweb2-module-ipl' 'icingaweb2-module-reactbundle')
url="http://www.icinga.org"
source=("https://github.com/Icinga/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('704f459f7ea7a237b4e3a5b305bd737735b3cca1f6187e7546f4db9e9f230015')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/etc/icingaweb2/modules/incubator"
  mkdir -p "$pkgdir/usr/share/webapps/icingaweb2/modules/incubator"

  cp -r vendor composer.json composer.lock module.info run.php \
    "$pkgdir/usr/share/webapps/icingaweb2/modules/incubator"
}
