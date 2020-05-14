# Maintainer: Hao Long <aur@esd.cc>

pkgname=platypus
pkgver=1.2.2
pkgrel=1
pkgdesc="A modern multiple reverse shell sessions manager written in go"
arch=("x86_64" "i686")
url="https://github.com/WangYihang/Platypus"
license=("LGPL3")
depends=("glibc")
makedepends=("go-pie")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('fa406deb00294f3f356cc80db1c26528a983f4093643bbf473ee0188fc5bfca0')

build() {
  cd Platypus-${pkgver}
  go build -trimpath -ldflags "-extldflags ${LDFLAGS}" .
}

package() {
  cd Platypus-${pkgver}
  install -Dm755 Platypus ${pkgdir}/usr/bin/${pkgname}
}
