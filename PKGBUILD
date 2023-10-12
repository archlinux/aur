# Maintainer: Yufan You <ouuansteve at gmail>

_npmname=git-split-diffs
pkgname=nodejs-git-split-diffs
pkgver=0.17.0
pkgrel=1
pkgdesc='GitHub style split diffs with syntax highlighting in your terminal.'
arch=('any')
url='https://github.com/banga/git-split-diffs'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
provides=('git-split-diffs')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('a21964875b78175cbd3257070951569a780e19371e18f6ce5da0651b7350a793')
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
