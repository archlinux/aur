# Maintainer: Michael Clayfield <me@michaelclayfield.com>

pkgname=icingaweb2-module-incubator
pkgver=0.11.0
pkgrel=1
pkgdesc="Bleeding edge libraries useful for Icinga Web 2 modules"
license=('GPL')
arch=('any')
depends=('icingaweb2' 'icingaweb2-module-ipl' 'icingaweb2-module-reactbundle')
url="http://www.icinga.org"
source=("https://github.com/Icinga/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b35583fb24ac292752a3d34faf61a547b3a094966711467e74c92a38b6b885b6')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/etc/icingaweb2/modules/incubator"
  mkdir -p "$pkgdir/usr/share/webapps/icingaweb2/modules/incubator"

  cp -r vendor composer.json composer.lock module.info run.php \
    "$pkgdir/usr/share/webapps/icingaweb2/modules/incubator"
}
