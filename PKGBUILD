# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=arc-firefox-theme
pkgver=48.20160802
pkgrel=1
pkgdesc="Official Arc Firefox theme"
arch=('any')
url="https://github.com/horst3180/${pkgname}/"
license=('custom:MPL2.0')
depends=('firefox' 'gtk-theme-arc')
makedepends=('zip' 'unzip')
source=("https://github.com/horst3180/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('231f217c1df6091987cdfbbbcec1e22397e8d4d947ab68749db25da332cecf40')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./autogen.sh \
    --prefix=/usr

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
