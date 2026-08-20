# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=minigraph
pkgver=0.21
pkgrel=2
pkgdesc="Pangenome graph construction and sequence-to-graph alignment tool"
arch=('x86_64')
url="https://github.com/lh3/minigraph"
license=('MIT')
depends=('zlib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4272447393f0ae1e656376abe144de96cbafc777414d4c496f735dd4a6d3c06a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 minigraph "$pkgdir/usr/bin/minigraph"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
