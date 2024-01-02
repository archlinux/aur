# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=editorconfig-geany
pkgver=0.2.1
pkgrel=1
pkgdesc="EditorConfig plugin for Geany"
arch=('x86_64' 'i686')
url="https://github.com/editorconfig/editorconfig-geany"
license=('GPL')
depends=('geany' 'editorconfig-core-c')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/editorconfig/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('22be66b409477b2e4936d27c5112db7e145346e084aebb88f8aec86cffb876a4f425d9eda8c9c18256cf51780e55dd3a44d18a4e2a3d89e368c6e49b350c6ac0')

build() {
  cd "$srcdir/${pkgname}-${pkgver}/"
  make EDITORCONFIG_PREFIX=/usr
}

package() {
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/${pkgname}.so" "$pkgdir/usr/lib/geany/${pkgname}.so"
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/COPYING" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
