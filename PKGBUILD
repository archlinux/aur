
# Maintainer: Daniel J. Campos <dcampos2015 at my dot fit dot edu>
# Contributor: Myles English <myles at rockhead dot biz>
pkgname=btrbk
pkgver=0.20.0
pkgrel=1
pkgdesc="btrbk is a backup tool for btrfs subvolumes, taking advantage of btrfs specific capabilities to create atomic snapshots and transfer them incrementally to your backup locations."
url="http://digint.ch/btrbk"
arch=('any')
license=('GPL3')
depends=('perl' 'perl-date-calc' 'btrfs-progs')
optdepends=('openssh: remote backup support',
	    'pv: --progress support')
source=("http://digint.ch/download/btrbk/releases/${pkgname}-${pkgver}.tar.bz2")

sha256sums=('03f499bbefdfd3a206f9d0f47072c2bdd484c4b7c55b80a7652cd5d51ba31122')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's/sbin/bin/g' contrib/systemd/btrbk.service
  make DESTDIR="${pkgdir}" BINDIR="/usr/bin" install
}


