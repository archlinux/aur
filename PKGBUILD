# Maintainer: Robin Broda <robin at broda dot me>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=('streem')
pkgver=201611
pkgrel=1
pkgdesc='prototype of stream based programming language'
arch=('x86_64')
depends=('glibc')
url="https://github.com/matz/streem"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/matz/streem/archive/${pkgver}.tar.gz")
sha256sums=('807a9ccf3162efb061a15a333943050b329f0232cceb55492e5cd582c09a7fb4')

build() {
  cd "${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 bin/streem "${pkgdir}/usr/bin/streem"

  cd examples
  find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${_pkgname}/examples/{}" \;
}
