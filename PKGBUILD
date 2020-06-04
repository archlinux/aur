# Maintainer: Hao Long <aur@esd.cc>

pkgname=shuffledns
pkgver=1.0.3
pkgrel=1
pkgdesc="A wrapper around massdns written in go"
arch=("x86_64" "i686")
url="https://github.com/projectdiscovery/shuffledns"
license=("GPL3")
provides=('shuffledns')
conflicts=('shuffledns')
depends=("massdns")
makedepends=("go-pie")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('efdb8e28561de1b72e02e2e7853963b384e49744edc07cecceaf53913a943b68')

build() {
  cd ${pkgname}-${pkgver}/cmd/${pkgname}
  go build -trimpath -ldflags "-extldflags ${LDFLAGS}" .
}

package() {
  cd ${pkgname}-${pkgver}/cmd/${pkgname}
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
