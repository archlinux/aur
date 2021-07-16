# Maintainer: Yufan You <ouuansteve at gmail>

_npmname=vscode-langservers-extracted
pkgname=vscode-langservers-extracted
pkgver=2.4.0
pkgrel=1
pkgdesc='vscode-langservers bin collection.'
arch=('any')
url='https://github.com/hrsh7th/vscode-langservers-extracted'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
sha256sums=('7b2033734f26ba7abb017d31bc3208d2f446b5d324fd5663e716ba7ce82ba3c3')
noextract=("${_npmname}-${pkgver}.tgz")

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  install -Dm644 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  chown -R root:root "${pkgdir}"
}
