# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Michael Duell < mail at akurei dot me >
# Contributor: Myles English <myles at rockhead dot biz>

pkgname=btrbk
pkgver=0.32.5
pkgrel=1
pkgdesc="Backup tool for btrfs subvolumes, taking advantage of btrfs specific capabilities to create atomic snapshots and transfer them incrementally to your backup locations"
arch=('any')
url="https://digint.ch/btrbk/"
license=('GPL3')
depends=('btrfs-progs' 'perl')
makedepends=('asciidoctor')
optdepends=('mbuffer: send/receive buffering and rate limiting, progress bars'
            'openssh: transfer backups from/to remote locations',
            'sudo: btrfs-progs-sudo backend')
source=("$pkgname-$pkgver.tar.gz::https://digint.ch/download/btrbk/releases/$pkgname-$pkgver.tar.xz")
sha256sums=('f1fe4091680216d78c7903d82a7f8ff95e98a5beb1d1ffdb2ba5293a8bc39fb4')

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" install
}

