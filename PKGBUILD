# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=crex
pkgver=0.2.5
pkgrel=1
pkgdesc="Explore, test, and check regular expressions in the terminal"
arch=('x86_64')
url="https://octobanana.com/software/${pkgname}"
license=('MIT')
source=("https://github.com/octobanana/${pkgname}/archive/${pkgver}.tar.gz")
makedepends=('cmake')
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")
sha256sums=('c6a166b7a1e696a7babeaf7c5728eece1624704a18357f827129fc95ef2ecc56')

build() {
  cd "${pkgname}-${pkgver}"
  cmake . -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}