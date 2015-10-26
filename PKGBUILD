
# Maintainer: Daniel J. Campos <dcampos2015 at my dot fit dot edu>
# Contributor: Myles English <myles at rockhead dot biz>
pkgname=btrbk
pkgver=0.21.0
pkgrel=1
pkgdesc="btrbk is a backup tool for btrfs subvolumes, taking advantage of btrfs specific capabilities to create atomic snapshots and transfer them incrementally to your backup locations."
url="http://digint.ch/btrbk"
arch=('any')
license=('GPL3')
depends=('perl' 'perl-date-calc' 'btrfs-progs')
optdepends=('openssh: remote backup support',
	    'pv: --progress support')
source=("http://digint.ch/download/btrbk/releases/${pkgname}-${pkgver}.tar.xz")

sha256sums=('c8fce308180a392a4770ca3ad45c294c2c02a4e6dd4d4f39085f4c34bee3356c')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's/sbin/bin/g' contrib/systemd/btrbk.service
  make DESTDIR="${pkgdir}" BINDIR="/usr/bin" install
}


