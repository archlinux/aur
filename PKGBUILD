# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=supersm
pkgver=0.4
pkgrel=1
pkgdesc="A Super Symlink Manager"
arch=("any")
url="https://github.com/peeweep/supersm"
license=('MIT')
makedepends=('boost' 'cmake' 'make')
provides=('supersm')
conflicts=('supersm-git')
source=("${pkgname}-${pkgver}.tar.gz"::${url}/archive/${pkgver}.tar.gz)
sha256sums=('be2f1aa9fce1a4226727544ce3e374ff348e78f49afa315a6bbdf571dc50183b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -Bbuild && make -C build
}

package() {
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
