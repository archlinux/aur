# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Falk Alexander Seidl <fa@terminal.run>

pkgname=sequeler
pkgver=0.7.91
pkgrel=1
pkgdesc='Friendly SQL Client'
arch=('x86_64')
url='https://github.com/Alecaddd/sequeler'
license=('GPL3')
depends=('granite' 'libgda-mysql' 'libgda-postgres')
makedepends=('meson' 'vala')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0214b1767488d0290c5c1d673cd604ba6ecdaa011e4871b02171c63e1c25bf48')

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