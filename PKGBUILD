# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=vscode-langservers-extracted
pkgver=4.2.1
pkgrel=1
pkgdesc="Language servers extracted from VSCode."
url="https://github.com/hrsh7th/vscode-langservers-extracted"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('d4edcaa10b19f967c27be757c4aabe59459401c12f02471c19ddf7e856ae400e')

prepare() {
  tar xf "$pkgname-$pkgver.tgz" package/LICENSE
}

package() {
  npm i -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  chown -R root:root "$pkgdir"
  install -Dm644 package/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
