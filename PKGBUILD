# Maintainer: Hao Long <aur@esd.cc>

pkgname=shuffledns
pkgver=1.0.2
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
sha256sums=('f33540acb21c9ab7e2b21f35ce6b5c16707402a60e0fd62819bd1f868343ce60')

build() {
  cd ${pkgname}-${pkgver}/cmd/${pkgname}
  go build -trimpath -ldflags "-extldflags ${LDFLAGS}" .
}

package() {
  cd ${pkgname}-${pkgver}/cmd/${pkgname}
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
