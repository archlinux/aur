# Maintainer: Daniel Bodky <dbodky@gmail.com>
# Contributor: Malte Rabenseifner <mail@malte-rabenseifner.de>

pkgname=icingaweb2-module-director-git
_pkgname=icingaweb2-module-director
pkgver=v1.8.1.r67.087ce05
pkgrel=1
pkgdesc="Manage Icinga 2 configuration from Icinga Web 2"
license=('GPL')
arch=('any')
depends=('icingaweb2' 'icingaweb2-module-ipl' 'icingaweb2-module-incubator' 'icingaweb2-module-reactbundle')
provides=('icingaweb2-module-director')
conflicts=('icingaweb2-module-director')
url="https://www.icinga.org"
source=("git+https://github.com/Icinga/icingaweb2-module-director.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"

  mkdir -p "$pkgdir/etc/icingaweb2/modules/director"
  mkdir -p "$pkgdir/usr/share/icingaweb2/modules/director"

  cp -r application contrib doc library public schema test \
    configuration.php module.info register-hooks.php run-missingdeps.php \
    run-php5.3.php run.php \
    "$pkgdir/usr/share/icingaweb2/modules/director"
}
