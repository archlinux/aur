# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Falk Alexander Seidl <fa@terminal.run>

pkgname=sequeler
pkgver=0.8.0
pkgrel=1
pkgdesc='Friendly SQL Client'
arch=('x86_64')
url='https://github.com/Alecaddd/sequeler'
license=('GPL3')
depends=('granite' 'libgda-mysql' 'libgda-postgres')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('471fdf63fda568d4caddf6182897518e4b7abc1b4f5dfb466bd1dfc86d380f0c')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
