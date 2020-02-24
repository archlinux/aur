# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=supersm
pkgver=0.4
pkgrel=2
pkgdesc="A Super Symlink Manager"
arch=("any")
url="https://github.com/peeweep/supersm"
license=('MIT')
makedepends=('boost' 'cmake' 'make')
provides=('supersm')
conflicts=('supersm-git')
source=("${pkgname}-${pkgver}.tar.gz"::${url}/archive/${pkgver}.tar.gz)
sha256sums=('52f8e73ef28480232d3372c9f508c433e1ff28bb403f895e2a969dcfef75494b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -Bbuild && make -C build
}

package() {
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
