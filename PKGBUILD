# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=supersm
pkgver=0.5
pkgrel=1
pkgdesc="A Super Symlink Manager"
arch=("any")
url="https://github.com/peeweep/supersm"
license=('MIT')
makedepends=('boost' 'cmake')
provides=('supersm')
conflicts=('supersm-git')
source=("${pkgname}-${pkgver}.tar.gz"::${url}/archive/${pkgver}.tar.gz)
sha256sums=('95543fefc390a8447811a6e57060e4c58954064297a6e02921a2cf49a6bf5c8f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -Bbuild && cmake --build build
}

package() {
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
