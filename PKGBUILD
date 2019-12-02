# Maintainer: Amish <contact at via dot aur>
pkgname=wdsaver
pkgver=1.1
pkgrel=1
pkgdesc='Stop hard drive from too frequent head parking'
arch=('x86_64')
url="https://github.com/amishmm/wdsaver"
license=('GPL')
optdepends=('hdparm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/amishmm/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('266530d8ad164478b1866c70d7ab5e2d777adabcac1c7830c29ca2fa53f42a5a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -D -m 700 -t "${pkgdir}"/usr/bin wdsaver
  install -D -m 644 -t "${pkgdir}"/usr/share/doc/wdsaver README
  install -D -m 644 -t "${pkgdir}"/usr/lib/systemd/system wdsaver.service
}
