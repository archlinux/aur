# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=prettier_d_slim
pkgver=1.0.0
pkgrel=1
pkgdesc="Makes Prettier fast."
url="https://github.com/mikew/prettier_d_slim"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('22b255a83fbbf8f46f9d06fbfc6c817efb498af299c3b9d61c6d0294067b0ec3')

prepare() {
  tar xf "${pkgname}-${pkgver}.tgz" package/LICENSE
}

package() {
  npm i -g --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  install -Dm644 package/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

