# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='kclock'
pkgver=0.2.1
pkgrel=1
pkgdesc='Convergent clock application for Plasma'
arch=('x86_64')
url='https://invent.kde.org/plasma-mobile/kclock'
license=('GPL2')
depends=('hicolor-icon-theme' 'plasma-framework')
makedepends=('extra-cmake-modules')
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('05c8bef6619eb652ae9a46f607f66a9fe31b2edcb0fdfe6c2ce22fce3a15121c')

build() {
  cmake -B 'build' -S "${pkgname}-v${pkgver}" \
    -DBUILD_TESTING=OFF
  make -C 'build'
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' -C 'build' install
  install -Dvm644 "${pkgname}-v${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
