# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=subminder
pkgver=1.2.0
pkgrel=1
pkgdesc='Keep tabs on your subscriptions'
arch=('x86_64')
url='https://github.com/jeremyvaartjes/subminder'
license=('GPL3')
depends=('granite')
makedepends=('libsoup' 'meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('86cacd55fbddfc248a4a79c5d11e871f3b5d117e8489b0de72a16da55510afe8')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
