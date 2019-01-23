# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=lz4json
pkgver=2
pkgrel=1
pkgdesc='C decompress tool for mozilla lz4json format'
arch=('x86_64')
url=https://github.com/andikleen/lz4json
license=('unknown')
depends=('lz4')
source=("$url/archive/v$pkgver/lz4json-v$pkgver.tar.gz")
sha512sums=('325653fb70b80bf5b37eb0b831caa22654cdc3d2bb5ba2afe7498580c2bb80e9983c5982902784905d9bfa41d85656d403a3096acf4809a6fec38fd6ec092493')

build() {
  cd lz4json-$pkgver
  make
}

package() {
  cd lz4json-$pkgver
  install -Dt "$pkgdir"/usr/bin lz4jsoncat
  install -Dm644 -t "$pkgdir"/usr/share/man/man1 lz4jsoncat.1
}
