# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=eslint_d
pkgver=11.1.1
pkgrel=1
pkgdesc="Makes eslint the fastest linter on the planet."
url="https://github.com/mantoni/eslint_d.js"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('cb733eba1dfaf99685220fee3e889752399cf95b855d2d24a204c708c6ed4f18')

prepare() {
  tar xf "${pkgname}-${pkgver}.tgz" package/LICENSE
}

package() {
  npm i -g --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  install -Dm644 package/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

