# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=sxcs
pkgver=0.6
pkgrel=1
pkgdesc="minimal X11 color picker and magnifier"
arch=('i686' 'x86_64')
url="https://codeberg.org/NRK/sxcs"
license=('GPL3')
depends=('libx11' 'libxcursor')
provides=("${pkgname}")
conflicts=("${pkgname}-git")

source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha256sums=('9334f47eed4907fa3ab98901ddf74980926501793816f2e8bd738d6c0978cad9')

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
