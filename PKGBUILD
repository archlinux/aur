# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='hackup'
pkgver=1.1.8
pkgrel=1
pkgdesc='Read Hacker News from the desktop'
arch=('x86_64')
url='https://github.com/mdh34/hackup'
license=('GPL3')
depends=('granite' 'webkit2gtk')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('c2391d56f0413803be329dd1942132fd9ddc1021649868e61281d8dccffe2b1b')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
