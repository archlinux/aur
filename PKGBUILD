# Maintainer: Michael Duell <michael.duell@rub.de>
# Contributor: Myles English <myles at rockhead dot biz>
pkgname=btrbk
pkgver=0.28.0
pkgrel=1
pkgdesc="Backup tool for btrfs subvolumes, taking advantage of btrfs specific capabilities to create atomic snapshots and transfer them incrementally to your backup locations"
url="http://digint.ch/btrbk"
arch=('any')
license=('GPL3')
depends=('perl' 'btrfs-progs')
conflicts=('btrbk-git')
makedepends=('asciidoc')
optdepends=('openssh: remote backup support',
	    'pv: --progress support',
        'mbuffer: add buffering to send-stream')
source=("http://digint.ch/download/btrbk/releases/${pkgname}-${pkgver}.tar.xz")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" BINDIR="/usr/bin" install
}

sha384sums=('2a0b53acf7aeb27b6d67ca250aa3c3b8130e27a00d4ae288166c243925cb88afd0de690b252285b3984b9a459366a928')
