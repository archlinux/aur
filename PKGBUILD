# Maintainer: Andrés González <aur.andres at pm dot me>

pkgname=some-sass-language-server
pkgver=1.8.1
pkgrel=1
pkgdesc="Sass LSP with improved code suggestions, documentation and code navigation for SCSS."
url="https://github.com/wkillerud/some-sass"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('bc6c31197defaf13d72d4bec2a3455b233d9c4b7a463e65be724edb9aa76733d')

prepare() {
  tar xf "$pkgname-$pkgver.tgz" package/LICENSE
}

package() {
  npm i -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  chown -R root:root "$pkgdir"
  install -Dm644 package/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
