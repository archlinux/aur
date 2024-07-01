# Maintainer: Yufan You <ouuansteve at gmail>

_npmname=git-split-diffs
pkgname=nodejs-git-split-diffs
pkgver=2.0.0
pkgrel=1
pkgdesc='GitHub style split diffs with syntax highlighting in your terminal.'
arch=('any')
url='https://github.com/banga/git-split-diffs'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
provides=('git-split-diffs')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('4fc81103a28728fb1925e1122967837c89aca5fd09fb6fb51c059066ee406d37')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  install -Dm644 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  chown -R root:root "${pkgdir}"
}
