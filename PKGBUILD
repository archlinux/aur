pkgname="autorestic-bin"
pkgver=1.7.10
_pkgid="${pkgname%-bin}-${pkgver}"
pkgrel=1
pkgdesc="High level CLI utility for restic"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/cupcakearmy/${pkgname%-bin}"
license=('Apache')
depends=('restic')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

sha256sums_i686=('e854419f2a1dc752b93c3c40c4753be2d5943d4e04e4d3b93f1a59f1ece98220')
sha256sums_x86_64=('be05d25deafd9c4fc407e50f78dcb06df0d0a718af7f1fe485c5d154e47f3072')
sha256sums_armv7h=('c55021557672a636777a93318075cf76f2c60b7d8f72515cc52de39feb1637b9')
sha256sums_aarch64=('1a485d0851dc96d26c2664b1ef5f2c282703a9c6f852edc67eee715ecaf3eef7')

source_i686=("${pkgname%-bin}-${pkgver}-i686.bz2"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.bz2")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.bz2"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.bz2")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.bz2"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.bz2")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.bz2"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm.bz2")

prepare() {
  bzip2 -fdc ${pkgname%-bin}-${pkgver}-$CARCH.bz2 > autorestic
  chmod +x autorestic
}

package() {
  mkdir -p "${pkgdir}/usr/local/bin/"
  cp "${srcdir}/autorestic" "${pkgdir}/usr/local/bin/autorestic"
}
