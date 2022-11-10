# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=sxcs
pkgver=0.7.1
pkgrel=1
pkgdesc="minimal X11 color picker and magnifier"
arch=('i686' 'x86_64')
url="https://codeberg.org/NRK/sxcs"
license=('GPL3')
depends=('libx11' 'libxcursor')
provides=("${pkgname}")
conflicts=("${pkgname}-git")

source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha256sums=('462b7e0a3ea21f847a1a0ddccad289043e89bae2191e8ad7d41396b76e9ceab4')

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"

  make DESTDIR="${pkgdir}" PREFIX="/usr" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
