# Maintainer: Michael Duell <michael.duell@rub.de>
# Contributor: Myles English <myles at rockhead dot biz>
pkgname=btrbk
pkgver=0.25.1
pkgrel=1
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
  make DESTDIR="${pkgdir}" BINDIR="/usr/bin" install
}
sha384sums=('f970842a90adb2fc6cc708cced5a09f96108b879eea2b40190155a85dcce6e316b0b341c722091b76d551560d638f49e')
