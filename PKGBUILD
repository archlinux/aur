# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='gcron'
pkgver=1.0.5
pkgrel=1
pkgdesc='Manage and understand your cron configuration with ease'
arch=('x86_64')
url='https://github.com/padjis/gcron'
license=('GPL3')
depends=('granite')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('a16d2790b7c8ab1cc76d4036e332376f56583e0dc6371eb08947b0fcf7212e39')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
