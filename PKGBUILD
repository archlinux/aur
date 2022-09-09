# Maintainer: Timofey Korolik

# _pkggit=hexowl
# _version=fd0307f0334ed7c2ff1baf24a2247ffd3595a35f
# _gitsha256='2cf985ecbff4db8039bbc6b0c27547bbad20867e1303008ee473861a033d6881'

pkgbase=hexowl
pkgname='hexowl'
pkgver=1.2.0
pkgrel=1
pkgdesc="hexowl is a Lightweight and flexible programmer's calculator with user variables and functions support written in Go."
arch=('i686' 'x86_64')
url="https://github.com/DECE2183/hexowl"
license=('GPL3')
makedepends=('go')
provides=('hexowl')
conflicts=('hexowl')
source=("hexowl-${pkgver}.tar.gz::https://github.com/DECE2183/hexowl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3e239a8bdc5a51a40a0e315ad560cc7097d35e8462d6f1421bc4ed0448fe8683')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  echo "Starting build..."
  go build
}

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  
  install -Dm755 "${pkgbase}" "${pkgdir}/usr/bin/${pkgbase}"
}