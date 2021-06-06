# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=supersm
pkgver=0.5.1
pkgrel=1
pkgdesc="A Super Symlink Manager"
arch=("any")
url="https://github.com/peeweep/supersm"
license=('MIT')
makedepends=('boost' 'cmake')
provides=('supersm')
conflicts=('supersm-git')
source=("${pkgname}-${pkgver}.tar.gz"::${url}/archive/${pkgver}.tar.gz)
sha256sums=('bdd0c78bce675d7a3629f4af7edc06247ed39dfb30df6f905a6561876fcae10c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -Bbuild && cmake --build build
}

package() {
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
