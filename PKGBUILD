pkgname="autorestic-bin"
pkgver=1.0.8
_pkgid="${pkgname%-bin}-${pkgver}"
pkgrel=3
pkgdesc="High level CLI utility for restic"
arch=('x86_64' 'i686' 'aarch32' 'aarch64')
url="https://github.com/cupcakearmy/${pkgname%-bin}"
license=('Apache')
depends=('restic')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

_arch_i686="386"
_arch_x86_64="amd64"
_arch_aarch32="arm"
_arch_aarch64="arm64"

sha256sums_x86_64=('34bacb5bb9b1236a540d5f188a4542bd2fed6e82ebd826f8ea432734b4936044')
sha256sums_i686=('1ab806ca51f6bdb20dfd40de8d530fe95d01bdc92c163d1920cb18fa76f48be4')
sha256sums_aarch32=('c5b53529e002f6cb22a84011621532964cc6b72846c01cf35a794bd866263f8c')
sha256sums_aarch64=('7f4044458cdd8b1602fd7108d46f37ecb526482855a663536d6882b894765277')

source_x86_64=("${pkgname%-bin}-$pkgver.bz2"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_x86_64}.bz2")
source_i686=("${pkgname%-bin}-$pkgver.bz2"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_i686}.bz2")
source_aarch32=("${pkgname%-bin}-$pkgver.bz2"::"${url}/${pkgname}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_aarch32}.bz2")
source_aarch64=("${pkgname%-bin}-$pkgver.bz2"::"${url}/${pkgname}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_aarch64}.bz2")

prepare() {
  bzip2 -fdc ${pkgname%-bin}-$pkgver.bz2 > autorestic
  chmod +x autorestic
}

package() {
  mkdir -p "${pkgdir}/usr/local/bin/"
  cp "${srcdir}/autorestic" "${pkgdir}/usr/local/bin/autorestic"
}
