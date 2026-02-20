# Maintainer: Orion-zhen <https://github.com/Orion-zhen>
pkgname=opencode-md-table-formatter
pkgver=0.0.3
pkgrel=1
pkgdesc="Markdown table formatter plugin for OpenCode with concealment mode support."
arch=('any')
url="https://github.com/franlol/opencode-md-table-formatter"
license=('MIT')
depends=('opencode' 'npm')
options=('!strip' '!debug')
conflicts=("${pkgname}-debug")
install=$pkgname.install

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a81fe06f5ec1d548fac379848be1a85a1a7618b57759b6dd64c986f45311753c')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install
  mkdir -p "$pkgdir/usr/lib/opencode/plugins/$pkgname"
  cp -r . "$pkgdir/usr/lib/opencode/plugins/$pkgname"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
