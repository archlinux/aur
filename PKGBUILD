# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=procdump
pkgver=1.3
pkgrel=1
pkgdesc='Generate coredumps based off performance triggers'
arch=('x86_64')
url=https://github.com/Sysinternals/ProcDump-for-Linux
license=('MIT')
depends=('gdb')
source=("$url/archive/$pkgver/ProcDump-for-Linux-$pkgver.tar.gz")
sha256sums=('2e3578789a8913616b65a927478d546f330a1634d11e44987ab5a5a222aa46b7')

build() {
  cd ProcDump-for-Linux-$pkgver
  make -j1
}

package() {
  cd ProcDump-for-Linux-$pkgver
  install -Dt "$pkgdir"/usr/bin bin/procdump
  install -Dm644 -t "$pkgdir"/usr/share/man/man1 procdump.1
  install -Dm644 -t "$pkgdir"/usr/share/licenses/procdump LICENSE
}

# vim:set ts=2 sw=2 et:
