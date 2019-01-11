# Maintainer: Bert Peters <bert@bertptrs.nl>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Yamakaky <yamakaky@yamaworld.fr>

pkgname='rust-src'
pkgver=1.31.1
pkgrel=1
pkgdesc='rustc source'
arch=('any')
url='http://rust-lang.org'
license=('Apache' 'MIT')
options=(!strip)
source=("rust-${pkgver}.tar.gz::https://github.com/rust-lang/rust/archive/${pkgver}.tar.gz")
sha256sums=('954342974ed53f366bfdd39c9b59d02beb949364985fd0dcf9a1b5919ed52341')

prepare() {
  cd "rust-${pkgver}"

  find . -type d -exec chmod 755 {} \;
  find . -type f -exec chmod 644 {} \;
}

package() {
  cd "rust-${pkgver}"

  install -d -m 755 "${pkgdir}/usr/src/rust/"
  install -Dt -m 644 "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE-*

  cp -p -r * "${pkgdir}/usr/src/rust/"
}

# vim: ts=2 sw=2 et:
