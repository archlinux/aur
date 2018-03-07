# Maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Yamakaky <yamakaky@yamaworld.fr>

pkgname='rust-src'
pkgver=1.24.1
pkgrel=1
pkgdesc='rustc source'
arch=('any')
url='http://rust-lang.org'
license=('Apache' 'MIT')
options=(!strip)
source=("rust-${pkgver}.tar.gz::https://github.com/rust-lang/rust/archive/${pkgver}.tar.gz")
sha256sums=('5d0054a2edea8cdab2f390291bd5f272f76747980dff2e9640a6eb277c5e57f3')

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
