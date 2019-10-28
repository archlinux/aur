# Maintainer: Michael Duell <michael.duell@rub.de>
# Contributor: Myles English <myles at rockhead dot biz>
pkgname=btrbk
pkgver=0.29.0
pkgrel=1
pkgdesc="Backup tool for btrfs subvolumes, taking advantage of btrfs specific capabilities to create atomic snapshots and transfer them incrementally to your backup locations"
url="https://digint.ch/btrbk"
arch=('any')
license=('GPL3')
depends=('perl' 'btrfs-progs')
conflicts=('btrbk-git')
makedepends=('asciidoctor')
optdepends=('openssh: remote backup support',
        'mbuffer: --progress support and add buffering to send-stream')
source=("https://digint.ch/download/btrbk/releases/${pkgname}-${pkgver}.tar.xz")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" BINDIR="/usr/bin" install
}

sha384sums=('b7ab2b0a6cae76903a6805cfffbcb207ad2c62e8a12c232113d61939f8a3591729179606bfaf32b96387d1a0f33e71d8')
