
# Maintainer: Daniel J. Campos <dcampos2015 at my dot fit dot edu>
# Contributor: Myles English <myles at rockhead dot biz>
pkgname=btrbk
pkgver=0.22.2
pkgrel=1
pkgdesc="A backup tool for btrfs subvolumes, taking advantage of btrfs specific capabilities to create atomic snapshots and transfer them incrementally to your backup locations."
url="http://digint.ch/btrbk"
arch=('any')
license=('GPL3')
depends=('perl' 'perl-date-calc' 'btrfs-progs')
optdepends=('openssh: remote backup support',
	    'pv: --progress support')
source=("http://digint.ch/download/btrbk/releases/${pkgname}-${pkgver}.tar.xz")

sha256sums=('6869124b16c3c907f8ef7896f1c6997976bf8c96fd5d71fce1940b731b886fbd')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's/sbin/bin/g' contrib/systemd/btrbk.service
  make DESTDIR="${pkgdir}" BINDIR="/usr/bin" install
}


