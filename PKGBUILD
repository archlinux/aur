# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=arc-firefox-theme
pkgver=47.20160607
pkgrel=1
pkgdesc="Official Arc Firefox theme"
arch=('any')
url="https://github.com/horst3180/${pkgname}/"
license=('custom:MPL2.0')
depends=('firefox' 'gtk-theme-arc')
source=("https://github.com/horst3180/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ac679c6ff6bd354912915e58be5bd68c6ffc07dea081d8f1ccb41cbc58fb1e24')

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
