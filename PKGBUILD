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
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('86cacd55fbddfc248a4a79c5d11e871f3b5d117e8489b0de72a16da55510afe8')

build() {
  cd "${pkgname}-${pkgver}"
  meson build --prefix=/usr
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C "${pkgname}-${pkgver}/build" install
  install -Dm644 "${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=2 sw=2 et: