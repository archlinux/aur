pkgname=zesh
pkgver=0.3.0
pkgrel=1
pkgdesc='Zellij session manager with zoxide integration'
arch=('x86_64')
url='https://github.com/roberte777/zesh'
license=('MIT')
depends=('zellij' 'zoxide')
optdepends=('git: enable zesh clone command')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/roberte777/zesh/archive/refs/tags/zesh-v${pkgver}.tar.gz")
sha256sums=('07e4df09acd3ddbafb033c9060348028a1dbc54c66d8a1a19f14c42e7ec38f5b')

_srcdir="${pkgname}-zesh-v${pkgver}"

build() {
  cd "$_srcdir"
  cargo build --release --package zesh
}

package() {
  cd "$_srcdir"

  install -Dm755 target/release/zesh "$pkgdir/usr/bin/zesh"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
