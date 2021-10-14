# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=eslint_d
pkgver=11.0.0
pkgrel=1
pkgdesc="Makes eslint the fastest linter on the planet."
url="https://github.com/mantoni/eslint_d.js"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('c309f10d009bddec71bfac0c5a848f4d944f9861123549d25389e49d87c4320d')

prepare() {
  tar xf "${pkgname}-${pkgver}.tgz" package/LICENSE
}

package() {
  npm i -g --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  install -Dm644 package/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

