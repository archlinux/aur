# Maintainer: Yamakaky <yamakaky@yamaworld.fr>

pkgname='rust-src'
pkgver=1.21.0
pkgrel=1
pkgdesc='rustc source'
arch=('any')
url='http://rust-lang.org'
license=('Apache' 'MIT')
options=(!strip)
source=("https://github.com/rust-lang/rust/archive/${pkgver}.tar.gz")
sha256sums=('a0e674cce176a5c90804d394e57887b278acfcdbda4fe0f2ae5876531a94faa4')

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
