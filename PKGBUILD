pkgname="autorestic-bin"
pkgver=1.7.3
_pkgid="${pkgname%-bin}-${pkgver}"
pkgrel=1
pkgdesc="High level CLI utility for restic"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/cupcakearmy/${pkgname%-bin}"
license=('Apache')
depends=('restic')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

sha256sums_i686=('bbe3abcd1f2d62e6e005919bc574de9409177b6d7b2cb299398a58201c8fd3ad')
sha256sums_x86_64=('fd3eb12ef3952ff7ebc6b9068009b0457da002606d0976514f7777cc441a68bd')
sha256sums_armv7h=('f112a8e20293771f63dde1a323c982afa2982ba770fbe2326be4a6328e5a7f99')
sha256sums_aarch64=('7d17f3468811d10f432d8720fc2a971349b743eaa507c60c4307e3585ee30b5d')

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
