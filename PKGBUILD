# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds

pkgname=editorconfig-geany
pkgver=0.2
pkgrel=1
pkgdesc="EditorConfig plugin for Geany"
arch=('x86_64' 'i686')
url="https://github.com/editorconfig/editorconfig-geany"
license=('GPL')
depends=('geany' 'editorconfig-core-c')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/editorconfig/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('4b0c37eb534613e7454c1e068179db5b262cf9e5aa00681802787231e1b35edf')

build() {
  cd "$srcdir/${pkgname}-${pkgver}/"
  make EDITORCONFIG_PREFIX=/usr
}

package() {
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/${pkgname}.so" "$pkgdir/usr/lib/geany/${pkgname}.so"
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/COPYING" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
