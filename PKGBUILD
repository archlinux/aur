# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=racktables
pkgver=0.21.5
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
sha1sums=('345637d9dbb59263689ca86e173c938b0eb3d009')

package() {
  cd RackTables-${pkgver}
  # note: override datadir var to use Arch-specific 'webapps' directory
  make DESTDIR="${pkgdir}" prefix=/usr datadir='$(prefix)/share/webapps' install install-docs
}

# vim: ft=sh syn=sh
