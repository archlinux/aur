# Maintainer: Timofey Korolik <https://github.com/DECE2183>

pkgbase=hexowl
pkgname='hexowl'
pkgver=1.4.0
pkgrel=1
pkgdesc="hexowl is a Lightweight and flexible programmer's calculator with user variables and functions support written in Go."
arch=('i686' 'x86_64')
url="https://github.com/DECE2183/hexowl"
license=('GPL3')
makedepends=('go')
provides=('hexowl')
conflicts=('hexowl')
source=("hexowl-${pkgver}.tar.gz::https://github.com/DECE2183/hexowl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b08f3fcf3be6b950f0d60e953e2ad856a14a4da637a2f982178e86d664f31887')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  echo "Starting build..."
  go build
}

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  
  install -Dm755 "${pkgbase}" "${pkgdir}/usr/bin/${pkgbase}"
}
