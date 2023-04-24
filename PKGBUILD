# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=vscode-langservers-extracted
pkgver=4.7.0
pkgrel=1
pkgdesc="Language servers extracted from VSCode."
url="https://github.com/hrsh7th/vscode-langservers-extracted"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('879a28e431f65d3b529d566b47ac8b469581f4c379b28ec3d9da026fe517c722')

prepare() {
  tar xf "$pkgname-$pkgver.tgz" package/LICENSE
}

package() {
  npm i -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  chown -R root:root "$pkgdir"
  install -Dm644 package/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
