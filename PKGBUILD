# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=arc-firefox-theme
pkgver=50.20161114
pkgrel=1
pkgdesc="Official Arc Firefox theme"
arch=('any')
url="https://github.com/horst3180/${pkgname}/"
license=('custom:MPL2.0')
depends=('firefox' 'arc-gtk-theme')
makedepends=('zip' 'unzip')
source=("https://github.com/horst3180/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c229c66a66cc37c275a42c8f11a848b377f07896ab01bc0d6812e8fc7ee3f2c3')

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
