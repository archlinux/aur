# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=racktables
pkgver=0.22.0
pkgrel=1
pkgdesc="Datacenter and server room asset management web-software"
arch=('any')
url="https://racktables.org/"
license=('GPL2')
depends=('mariadb-clients' 'php73' 'php73-gd')
optdepends=(
    'php73-snmp'
    'mariadb: local database'
    'percona-server: local database'
)
source=("https://downloads.sourceforge.net/project/racktables/RackTables-${pkgver}.tar.gz")
sha1sums=('8d73f90701f492d0df70c963090a5a04db858116')

package() {
  cd RackTables-${pkgver}
  # note: override datadir var to use Arch-specific 'webapps' directory
  make DESTDIR="${pkgdir}" prefix=/usr datadir='$(prefix)/share/webapps' install install-docs
}

# vim: ft=sh syn=sh
