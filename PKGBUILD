# Maintainer: haoyuanli <1513624626@qq.com>

_npmname=fanyi
_npmver=10.0.0
pkgname=nodejs-fanyi
pkgver=10.0.0
pkgrel=1
pkgdesc="A 🇨🇳 and 🇺🇸🇬🇧 translator in your command line, powered by iciba and deepseek."
arch=(any)
url="https://github.com/afc163/fanyi#readme"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
sha1sums=('4ce6083a0eb066e0e54c393acb5b23221f19db02')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$_npmver.tgz"
  chown -R root:root "$pkgdir"

  install -Dm644 "$srcdir/package/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
