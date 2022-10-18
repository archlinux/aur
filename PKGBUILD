# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=purescript-language-server
pkgver=0.17.0
pkgrel=1
pkgdesc="Node-based Language Server Protocol server for PureScript."
url="https://github.com/nwolverson/$pkgname"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('eec44b6c9838a8b066e7cdb2fb7f6d77c5ef1a92e2efff5bd52a05fc3ef56815')

prepare() {
  tar xf "$pkgname-$pkgver.tgz" package/LICENSE.md
}

package() {
  npm i -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  chown -R root:root "$pkgdir"
  install -Dm644 package/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

