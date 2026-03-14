# Maintainer: Orion-zhen <https://github.com/Orion-zhen>
pkgname=opencode-md-table-formatter
pkgver=0.0.6
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
sha256sums=('03f77dd99465653983d5035715614b5b94d7670906231b5c67e2060e5b289455')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install
  mkdir -p "$pkgdir/usr/lib/opencode/plugins/$pkgname"
  cp -r . "$pkgdir/usr/lib/opencode/plugins/$pkgname"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
