# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=horizontal-rule
_pkgname=hr
pkgver=0.5.0
pkgrel=1
pkgdesc="A horizontal rule for the terminal"
arch=('x86_64')
url="https://octobanana.com/software/${_pkgname}"
license=('MIT')
source=("https://github.com/octobanana/${_pkgname}/archive/${pkgver}.tar.gz")
makedepends=('cmake')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
sha256sums=('18b499b7886acdd3099768e1789c4d5f73195976df65bbf1e201a995f491a9bd')

build() {
  cd "${_pkgname}-${pkgver}"
  cmake . -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}