# Maintainer: peeweep <peeweep at 0x0 dot ee> 

pkgname=ipv666
pkgver=0.4.0
pkgrel=1
pkgdesc='Golang IPv6 address enumeration'
arch=('any')
url='https://github.com/lavalamp-/ipv666'
license=('BSD')
makedepends=('go-pie>=1.11')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f88400ee7edbfe67bf628991c25252df5aa86b87d79d5f1befc27d127d6f9a74')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOCACHE="${srcdir}/${pkgname}-${pkgver}/gocache"
  make build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 bin/ipv666 "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
