# Maintainer: Timofey Korolik <https://github.com/DECE2183>

pkgbase=hexowl
pkgname='hexowl'
pkgver=1.3.1
pkgrel=1
pkgdesc="hexowl is a Lightweight and flexible programmer's calculator with user variables and functions support written in Go."
arch=('i686' 'x86_64')
url="https://github.com/DECE2183/hexowl"
license=('GPL3')
makedepends=('go')
provides=('hexowl')
conflicts=('hexowl')
source=("hexowl-${pkgver}.tar.gz::https://github.com/DECE2183/hexowl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9a594621c3d77576c50b6ab5f8abbe01294854cc9c5321baa3d0caf7d33dd718')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  echo "Starting build..."
  go build
}

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  
  install -Dm755 "${pkgbase}" "${pkgdir}/usr/bin/${pkgbase}"
}
