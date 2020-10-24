# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='kclock'
pkgver=0.2
pkgrel=2
pkgdesc='Convergent clock application for Plasma'
arch=('x86_64')
url='https://invent.kde.org/plasma-mobile/kclock'
license=('GPL2')
depends=('hicolor-icon-theme' 'plasma-framework')
makedepends=('extra-cmake-modules')
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('9c7286f79d10427cac4ea31faba59009185bc44c86fae9a32c7e93cdc92b12a4')

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
