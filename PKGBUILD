# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=racktables
pkgver=0.20.14
pkgrel=1
pkgdesc="Datacenter and server room asset management web-software"
arch=('any')
url="https://racktables.org/"
license=('GPL2')
depends=('mariadb-clients' 'php' 'php-gd')
optdepends=('php-snmp')
source=("https://downloads.sourceforge.net/project/racktables/RackTables-${pkgver}.tar.gz")
md5sums=('596668a2dcbe39a62e35583727b3f956')

package() {
  cd RackTables-${pkgver}
  # note: override datadir var to use Arch-specific 'webapps' directory
  make DESTDIR="${pkgdir}" prefix=/usr datadir='$(prefix)/share/webapps' install install-docs
}

# vim: ft=sh syn=sh
