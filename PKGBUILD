# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

pkgname='netsleuth'
pkgver=1.1.2
pkgrel=1
pkgdesc='Simple utility for calculating and analyzing IP subnet values'
arch=('any')
url='https://github.com/vmkspv/netsleuth'
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'hicolor-icon-theme'
  'libadwaita'
  'python-gobject'
)
makedepends=(
  'meson'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f39ed9aeac19e84fa3d082aee6a5ac8a707cd53d7816482d4c9aaa018b20adf5')

build() {
  cd "${pkgname}-${pkgver}"
  arch-meson build
  meson compile -C build
}

package() {
  cd "${pkgname}-${pkgver}"
  meson install -C build --no-rebuild --destdir "${pkgdir}"
  install -Dm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
}

