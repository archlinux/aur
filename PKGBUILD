# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='kclock'
pkgver=0.3.0
pkgrel=1
pkgdesc='Convergent clock application for Plasma'
arch=('x86_64')
url='https://invent.kde.org/plasma-mobile/kclock'
license=('GPL2')
depends=('hicolor-icon-theme' 'plasma-framework')
makedepends=('extra-cmake-modules')
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('b0d997362a5f56c2efc5c81827c4d0ca0a4110fff237ccf062413b03134c59f4')

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
