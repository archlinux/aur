# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='yishu'
pkgver=1.2.5
pkgrel=1
pkgdesc='Bespoke and simple Todo.txt client'
arch=('x86_64')
url='https://github.com/lainsce/yishu/'
license=('GPL3')
depends=('granite')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('fbb1ebcf16672b818cb92f7022c1d9e5e17bdb1b776612535e0af6a8abd75a39')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
