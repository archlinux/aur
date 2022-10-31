# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=purescript-language-server
pkgver=0.17.1
pkgrel=1
pkgdesc="Node-based Language Server Protocol server for PureScript."
url="https://github.com/nwolverson/$pkgname"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('139bc898210ae77342fbfd9d93de3be2c36368319be8840be8952182ed62b1bf')

prepare() {
  tar xf "$pkgname-$pkgver.tgz" package/LICENSE.md
}

package() {
  npm i -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  chown -R root:root "$pkgdir"
  install -Dm644 package/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

