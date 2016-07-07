# Maintainer: Malte Rabenseifner <mail@malte-rabenseifner.de>

pkgname=icingaweb2-module-director-git
_pkgname=icingaweb2-module-director
pkgver=r2194.ce4560f
pkgrel=1
pkgdesc="Manage Icinga 2 configuration from Icinga Web 2"
license=('GPL')
arch=('any')
depends=('icingaweb2')
provides=('icingaweb2-module-director')
conflicts=('icingaweb2-module-director')
url="http://www.icinga.org"
source=("git+https://github.com/Icinga/icingaweb2-module-director.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"

  #mkdir -p "$pkgdir/etc/webapps/icingaweb2/modules/director"
  mkdir -p "$pkgdir/etc/icingaweb2/modules/director"
  mkdir -p "$pkgdir/usr/share/webapps/icingaweb2/modules/director"

  cp -r application doc library public schema test \
    configuration.php module.info run.php \
    "$pkgdir/usr/share/webapps/icingaweb2/modules/director"

  #install -Dm644 COPYING "$pkgdir/usr/share/licenses/icingaweb2/LICENSE"
}
