# Maintainer: Michael Duell <michael.duell@rub.de>
# Contributor: Myles English <myles at rockhead dot biz>
pkgname=btrbk
pkgver=0.28.2
pkgrel=1
pkgdesc="Backup tool for btrfs subvolumes, taking advantage of btrfs specific capabilities to create atomic snapshots and transfer them incrementally to your backup locations"
url="https://digint.ch/btrbk"
arch=('any')
license=('GPL3')
depends=('perl' 'btrfs-progs')
conflicts=('btrbk-git')
makedepends=('asciidoctor')
optdepends=('openssh: remote backup support',
	    'pv: --progress support',
        'mbuffer: add buffering to send-stream')
source=("https://digint.ch/download/btrbk/releases/${pkgname}-${pkgver}.tar.xz")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" BINDIR="/usr/bin" install
}

sha384sums=('89a1e85c126e2c188e76811a4afb3eee640a61984f102bcf5aa7d1a3b2b334ebf904f0979b401935bff98ddeefac042d')
