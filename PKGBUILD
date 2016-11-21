# Maintainer: Daniel J. Campos <dcampos2015 at my dot fit dot edu>
pkgname=btrbk-git
pkgver=v0.24.0.r0.gda849b3
pkgrel=1
pkgdesc="A backup tool for btrfs subvolumes, taking advantage of btrfs specific capabilities to create atomic snapshots and transfer them incrementally to your backup locations."
url="http://digint.ch/btrbk"
arch=('any')
license=('GPL3')
conflicts=('btrbk')
depends=('perl' 'perl-date-calc' 'btrfs-progs')
optdepends=('openssh: remote backup support',
	    'pv: --progress support')
source=("git+https://github.com/digint/btrbk.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/btrbk"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


package() {
  cd "${srcdir}/btrbk"
  make DESTDIR="${pkgdir}" BINDIR="/usr/bin" install
  #install -Dm644 COPYING "$pkgdir/usr/share/licenses/btrbk/COPYING"
}


