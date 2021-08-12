# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

# See regarding pkgname and pkgver:
# https://github.com/mikew/prettier_d_slim/issues/5

pkgname=prettier_d_slim
_pkgname=prettier_d_slim_latest
pkgver=1.1.0
_pkgver=1.1.6
pkgrel=1
pkgdesc="Makes Prettier fast."
url="https://github.com/mikew/prettier_d_slim"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${_pkgver}.tgz")
noextract=("${_pkgname}-${_pkgver}.tgz")
sha256sums=('037955173b28f328e878be79cff122d9f26911a29835dcb7a5ca1386399d9258')

prepare() {
  tar xf "${_pkgname}-${_pkgver}.tgz" package/LICENSE
}

package() {
  npm i -g --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$_pkgver.tgz"
  install -Dm644 package/LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

