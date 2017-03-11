# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=arc-firefox-theme
pkgver=51.20170123
pkgrel=1
pkgdesc="Official Arc Firefox theme"
arch=('any')
url="https://github.com/horst3180/${pkgname}/"
license=('custom:MPL2.0')
depends=('firefox' 'arc-gtk-theme')
makedepends=('zip' 'unzip')
source=("https://github.com/horst3180/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('b398a3f674a076fe4a08df17db8afacdd45e143a2eea7194a8fe2735534f23cc')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./autogen.sh \
    --prefix=/usr

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
