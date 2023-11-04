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
sha256sums=('bc105a5b2df6a78466d71cb50080d9c69d8ba819559f8787a06efd3699c7f737')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  echo "Starting build..."
  go build
}

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  
  install -Dm755 "${pkgbase}" "${pkgdir}/usr/bin/${pkgbase}"
}
