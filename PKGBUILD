
# Maintainer: Daniel J. Campos <dcampos2015 at my dot fit dot edu>
# Contributor: Myles English <myles at rockhead dot biz>
pkgname=btrbk
pkgver=0.19.3
pkgrel=1
pkgdesc="btrbk is a backup tool for btrfs subvolumes, taking advantage of btrfs specific capabilities to create atomic snapshots and transfer them incrementally to your backup locations."
url="http://digint.ch/btrbk"
arch=('any')
license=('GPL3')
depends=('perl' 'perl-date-calc' 'btrfs-progs')
optdepends=('openssh: remote backup support')
source=("http://digint.ch/download/btrbk/releases/${pkgname}-${pkgver}.tar.bz2")

sha256sums=('8950d625200de1b77b090a1c92f2e7af01e6d1644ee2b96984fe0eedb12c7394')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's/sbin/bin/g' contrib/systemd/btrbk.service
  make DESTDIR="${pkgdir}" BINDIR="/usr/bin" install
}


