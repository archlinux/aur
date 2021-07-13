# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=eslint_d
pkgver=10.1.3
pkgrel=1
pkgdesc="Makes eslint the fastest linter on the planet."
url="https://github.com/mantoni/eslint_d.js"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=("8a6b755fe5f5d896d8eb519334c27e069445e4aca2f05baca3343f2778ef3b6a")

prepare() {
  tar xf "${pkgname}-${pkgver}.tgz" package/LICENSE
}

package() {
  npm i -g --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  install -Dm644 package/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

