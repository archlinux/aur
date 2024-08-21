# Maintainer: Andrés González <aur.andres at pm dot me>

pkgname=some-sass-language-server
pkgver=1.5.2
pkgrel=1
pkgdesc="Sass LSP with improved code suggestions, documentation and code navigation for SCSS."
url="https://github.com/wkillerud/some-sass"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('2e6c06ab19c34fb979ff22b64a24cc0f668bfbbf040401493c68a0843ca3956a')

prepare() {
  tar xf "$pkgname-$pkgver.tgz" package/LICENSE
}

package() {
  npm i -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  chown -R root:root "$pkgdir"
  install -Dm644 package/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
