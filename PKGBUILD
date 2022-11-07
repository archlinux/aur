# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Falk Alexander Seidl <fa@terminal.run>

# shellcheck disable=SC2034
pkgname=sequeler
pkgver=0.8.2
pkgrel=1
pkgdesc='Friendly SQL Client'
arch=('x86_64')
url='https://github.com/Alecaddd/sequeler'
license=('GPL3')
depends=('granite' 'libgda5-mysql' 'libgda-postgres')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('66ae40d8fc6bf5aa0f5608ffc32c3b66c2ff78deb675d301112a8eca7f050876')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

# shellcheck disable=SC2154
package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
