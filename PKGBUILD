# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

# See regarding pkgname and pkgver:
# https://github.com/mikew/prettier_d_slim/issues/5

pkgname=prettier_d_slim
pkgver=1.2.0
pkgrel=1
pkgdesc="Makes Prettier fast."
url="https://github.com/mikew/prettier_d_slim"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('ddde3262fdef75cc926743ea69c068eabd9808e47e1554f561a316821485c621')

prepare() {
  tar xf "${pkgname}-${pkgver}.tgz" package/LICENSE
}

package() {
  npm i -g --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  install -Dm644 package/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

