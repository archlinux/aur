# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=purescript-language-server
pkgver=0.18.0
pkgrel=1
pkgdesc="Node-based Language Server Protocol server for PureScript."
url="https://github.com/nwolverson/$pkgname"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('4814f287375c5b03ff71d11ab43e2eab7c87bb4d856d22db70cd45f9051ec327')

prepare() {
  tar xf "$pkgname-$pkgver.tgz" package/LICENSE.md
}

package() {
  npm i -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  chown -R root:root "$pkgdir"
  install -Dm644 package/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

