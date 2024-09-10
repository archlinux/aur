# Maintainer: Andrés González <aur.andres at pm dot me>

pkgname=some-sass-language-server
pkgver=1.7.0
pkgrel=1
pkgdesc="Sass LSP with improved code suggestions, documentation and code navigation for SCSS."
url="https://github.com/wkillerud/some-sass"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('402a68e3568b69762aee2572c4d2db40782eff3caf955122815b064b87b25e10')

prepare() {
  tar xf "$pkgname-$pkgver.tgz" package/LICENSE
}

package() {
  npm i -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  chown -R root:root "$pkgdir"
  install -Dm644 package/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
