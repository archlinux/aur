# Maintainer: franlol
pkgname=gbins
pkgver=0.1.0
pkgrel=1
pkgdesc="GTFOBins in your terminal — fuzzy-search and copy the exploit"
arch=('x86_64' 'aarch64')
url="https://github.com/franlol/gbins"
license=('MIT')
makedepends=('bun')
conflicts=('gbins-bin')
options=(!strip)
source=("gbins-$pkgver.tar.gz::https://github.com/franlol/gbins/archive/refs/tags/v0.1.0.tar.gz")
sha256sums=('d66969fafa67b00b50ecf66f2cf20e168ffd2635dddd32f5a280baaeb1a33bc1')

build() {
  cd "$srcdir/gbins-0.1.0"
  bun install --frozen-lockfile
  bun build --compile src/index.tsx --outfile gbins
}

package() {
  cd "$srcdir/gbins-0.1.0"
  install -Dm755 gbins "$pkgdir/usr/bin/gbins"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
