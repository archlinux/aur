# Maintainer: Michael Duell <michael.duell@rub.de>
# Contributor: Myles English <myles at rockhead dot biz>
pkgname=btrbk
pkgver=0.27.0
pkgrel=1
pkgdesc="Backup tool for btrfs subvolumes, taking advantage of btrfs specific capabilities to create atomic snapshots and transfer them incrementally to your backup locations"
url="http://digint.ch/btrbk"
arch=('any')
license=('GPL3')
depends=('perl' 'btrfs-progs')
makedepends=('asciidoc')
optdepends=('openssh: remote backup support',
	    'pv: --progress support',
        'mbuffer: add buffering to send-stream')
source=("http://digint.ch/download/btrbk/releases/${pkgname}-${pkgver}.tar.xz")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" BINDIR="/usr/bin" install
}
sha384sums=('99613a528b5775ae57d54ba5ac3ecfdccbde3e45492f214ba442cff35579331b1b70d63fc203da0ec79944627b204cdf')

