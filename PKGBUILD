# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=procdump
pkgver=1.1
pkgrel=1
pkgdesc='Generate coredumps based off performance triggers'
arch=('x86_64')
url=https://github.com/Microsoft/ProcDump-for-Linux
license=('MIT')
depends=('gdb')
source=("$url/archive/$pkgver/ProcDump-for-Linux-$pkgver.tar.gz")
sha512sums=('93350c0c38f14361422994a3170369a8987adbc68ff9aec47f7f7bb3b05c331f6e5723b75e9783b6cae9d1a9f9b05966f7e4dd391055f10cba49ec1472e3c8be')

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
