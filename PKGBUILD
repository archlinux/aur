# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=purescript-language-server
pkgver=0.15.7
pkgrel=1
pkgdesc="Node-based Language Server Protocol server for PureScript."
url="https://github.com/nwolverson/${pkgname}"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('ead075cfe8302beffb413f0cfb479bc2f98261cfab95d9687e8e9eae7c9ee125')

prepare() {
  tar xf "${pkgname}-${pkgver}.tgz" package/LICENSE.md
}

package() {
  npm i -g --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  install -Dm644 package/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

