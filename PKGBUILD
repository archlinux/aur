# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=carbon-now-cli-bin
_npmname=carbon-now-cli
pkgver=1.4.0
pkgrel=1
pkgdesc='Beautiful images of your code — from right inside your terminal.'
provides=('carbon-now-cli')
conflicts=('carbon-now-cli')
arch=('any')
url='https://github.com/mixn/carbon-now-cli'
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'git')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('d9463e2ce016d1460301c0d2eb0114146f594ec1b88277dda7fdd6d1364a31e8')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  install -Dm644 "$_npmdir/$_npmname/license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  chown -R root:root "${pkgdir}"
}
