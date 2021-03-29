# Maintainer: dimytch <aspamkiller@yandex.ru>

pkgname=godoc-static
pkgver=0.1
pkgrel=9
_binname=godoc-static
pkgdesc="Generates static documentation for go program."
arch=('x86_64' 'i686')
url="https://code.rocketnine.space/tslocum/godoc-static"
source=("https://code.rocketnine.space/tslocum/${pkgname}/archive/v${pkgver}.${pkgrel}.tar.gz")
license=('MIT')
makedepends=('go' 'git' 'go-tools')
options=('!strip' '!emptydirs')
sha512sums=(f5e39afccc914a7b6921480697d05e3bf8cfec3b9ec85225ebee2edbdabfd8023ce6a1c34ea8103460b7ec5040ca6f67fb65a4646301f58f2d3f580e6afbce7d)

prepare() {
  rm -rf build/
  mkdir -p build/
  mkdir -p cache/
}

build() {
  cd "${srcdir}/${pkgname}"
  go build
}

package() {
  install -Dm755 "${srcdir}/${pkgname}/${_binname}" "${pkgdir}/usr/bin/${_binname}"
}
