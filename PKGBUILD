# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

pkgname='netsleuth'
pkgver=1.1.1
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
sha256sums=('d4e769ce26a31ce18b6b4a9b38a04160f593ad93389f38fcca4adcf4ed9d2dd4')

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

