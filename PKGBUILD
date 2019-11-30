# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=racktables
pkgver=0.21.4
pkgrel=1
pkgdesc="Datacenter and server room asset management web-software"
arch=('any')
url="https://racktables.org/"
license=('GPL2')
depends=('mariadb-clients' 'php' 'php-gd')
optdepends=(
    'php-snmp'
    'mariadb: local database'
    'percona-server: local database'
)
source=("https://downloads.sourceforge.net/project/racktables/RackTables-${pkgver}.tar.gz")
sha1sums=('c53b8af6ffdc6546951a82cc2ecfd7e5e5a88652')

package() {
  cd RackTables-${pkgver}
  # note: override datadir var to use Arch-specific 'webapps' directory
  make DESTDIR="${pkgdir}" prefix=/usr datadir='$(prefix)/share/webapps' install install-docs
}

# vim: ft=sh syn=sh
