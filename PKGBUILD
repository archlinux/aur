# Maintainer: Yufan You <ouuansteve at gmail>

_npmname=git-split-diffs
pkgname=nodejs-git-split-diffs
pkgver=0.10.0
pkgrel=1
pkgdesc='GitHub style split diffs with syntax highlighting in your terminal.'
arch=('x86_64')
url='https://github.com/banga/git-split-diffs'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('9ccb4b76633e33156cca6084a65dcf02c676ef15aadf5911739910e4a69214af')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$_npmname@$pkgver"
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
  install -Dm644 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
