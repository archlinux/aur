# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=supersm
pkgver=0.5.1
pkgrel=2
pkgdesc="A Super Symlink Manager"
arch=("any")
url="https://github.com/peeweep/supersm"
license=('MIT')
makedepends=('boost' 'cmake')
provides=('supersm')
conflicts=('supersm-git')
source=("${pkgname}-${pkgver}.tar.gz"::${url}/archive/${pkgver}.tar.gz)
sha256sums=('8625a8241f74ac4d928c8fa9d96700bee9cef63cea38194c67bd87c0545e9584')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -Bbuild && cmake --build build
}

package() {
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
