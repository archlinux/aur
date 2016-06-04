# Maintainer: Michael Duell <michael.duell@rub.de>
# Contributor: Myles English <myles at rockhead dot biz>
pkgname=btrbk
pkgver=0.23.1
pkgrel=2
pkgdesc="Backup tool for btrfs subvolumes, taking advantage of btrfs specific capabilities to create atomic snapshots and transfer them incrementally to your backup locations"
url="http://digint.ch/btrbk"
arch=('any')
license=('GPL3')
depends=('perl' 'btrfs-progs')
optdepends=('openssh: remote backup support',
	    'pv: --progress support')
source=("http://digint.ch/download/btrbk/releases/${pkgname}-${pkgver}.tar.xz")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's/sbin/bin/g' contrib/systemd/btrbk.service
  make DESTDIR="${pkgdir}" BINDIR="/usr/bin" install
}
sha384sums=('40db074c29e0d894f9491090de4ee4575f459134ecf82d9010a49aea3be0c1a72aa2fe1837a28361a08a8554e65598ba')
