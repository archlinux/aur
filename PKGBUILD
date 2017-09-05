# Maintainer: Yamakaky <yamakaky@yamaworld.fr>

pkgname='rust-src'
pkgver=1.20.0
pkgrel=1
pkgdesc='rustc source'
arch=('any')
url='http://rust-lang.org'
license=('Apache' 'MIT')
options=(!strip)
source=(
  "rust-${pkgver}.tar.gz::https://github.com/rust-lang/rust/archive/${pkgver}.tar.gz"
)
sha256sums=(
  'ca9307bf18a422029a1fca19ae1fa6c22e3047ff066fb041f9d0a9c886937860'
)

prepare() {
  cd "rust-${pkgver}"

  find . -type d -exec chmod 755 {} \;
  find . -type f -exec chmod 644 {} \;
}

package() {
  cd "rust-${pkgver}"

  install -d -m 755 "${pkgdir}/usr/src/rust/"

  cp -p -r * "${pkgdir}/usr/src/rust/"
}

# vim: ts=2 sw=2 et:
