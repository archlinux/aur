# Maintainer: Andrés González <aur.andres at pm dot me>

pkgname=cspell-lsp
pkgver=1.1.5
pkgrel=1
pkgdesc="Performs spell checking in source code files, using the cspell library."
url="https://github.com/vlabo/cspell-lsp"
license=("GNU General")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/@vlabo/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=("1338db0080360e2e2cd9af7d0444553f1929adddf31a554dd1ba78997d1588af")

prepare() {
  tar xf "$pkgname-$pkgver.tgz" package/LICENSE
}

package() {
  npm i -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  chown -R root:root "$pkgdir"
  install -Dm644 package/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

