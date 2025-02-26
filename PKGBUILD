# Maintainer: Andrés González <aur.andres at pm dot me>

pkgname=some-sass-language-server
pkgver=2.1.1
pkgrel=1
pkgdesc="Sass LSP with improved code suggestions, documentation and code navigation for SCSS."
url="https://github.com/wkillerud/some-sass"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('cd1407f5a425983b2df6f33491b4defebfbd64fc2c8a888660a7ecb83e219df7')

prepare() {
  tar xf "$pkgname-$pkgver.tgz" package/LICENSE
}

package() {
  npm i -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  chown -R root:root "$pkgdir"
  install -Dm644 package/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
