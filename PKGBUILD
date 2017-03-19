# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=arc-firefox-theme
pkgver=52.20170311
pkgrel=1
pkgdesc="Official Arc Firefox theme"
arch=('any')
url="https://github.com/horst3180/${pkgname}/"
license=('custom:MPL2.0')
depends=('firefox' 'arc-gtk-theme')
makedepends=('zip' 'unzip')
source=("https://github.com/horst3180/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('e169a222b64aa776a08f740eccefadefb2a215ec2d684ea6f39f0795987b7c1d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
