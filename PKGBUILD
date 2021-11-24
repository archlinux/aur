# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

_pkgver=1.0.0-pre.53
pkgname=yalc
pkgver=1.0.0.pre.53
pkgrel=1
pkgdesc="Better workflow than npm/yarn link for package authors."
url="https://github.com/wclr/yalc"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${_pkgver}.tgz")
noextract=("${pkgname}-${_pkgver}.tgz")
sha256sums=('78a97cd2051cae8ff9bc1fa76210b66b38e12aaeed46784ea052364558aa58f2')

prepare() {
  tar xf "${pkgname}-${_pkgver}.tgz" package/LICENCE.md
}

package() {
  npm i -g --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$_pkgver.tgz"
  install -Dm644 package/LICENCE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
