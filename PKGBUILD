# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Helder Bertoldo <helder.bertoldo@gmail.com>

pkgname=regextester
pkgver=1.1.0
pkgrel=2
pkgdesc='A simple regex tester'
arch=('x86_64' 'i686')
url='https://github.com/artemanufrij/regextester'
license=('GPL3')
depends=('granite')
makedepends=('meson' 'vala')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('a9785c86357288632079bad7d897af7d2216e8ed2fcf6467f9991fd7adb26d3b')

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