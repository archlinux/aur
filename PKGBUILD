pkgname="autorestic-bin"
pkgver=1.2.0
_pkgid="${pkgname%-bin}-${pkgver}"
pkgrel=1
pkgdesc="High level CLI utility for restic"
arch=('x86_64' 'i686' 'aarch32' 'aarch64')
url="https://github.com/cupcakearmy/${pkgname%-bin}"
license=('Apache')
depends=('restic')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

_arch_i686="386"
_arch_x86_64="amd64"
_arch_aarch64="arm64"
_arch_aarch32="arm"

sha256sums_x86_64=('b581d5ea36fc73562fc9a7eaed861a09d4077794bfd6ec02c2a5fbf98e2e4c63')
sha256sums_i686=('2f5d4f3b940d91b464c3e62867684d02e206d9432be57728f23eeb6163de0570')
sha256sums_aarch32=('6db2f0215ac8b45dadf6cd56ffbf34585b49eec119d5f2ec1d0fb378f5f1a38e')
sha256sums_aarch64=('2cf0391c873eff7a6e820ee6db2af1119e849bafa9ea0e451841d097ab115677')

source_i686=("${pkgname%-bin}-$pkgver-$arch.bz2"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_i686}.bz2")
source_x86_64=("${pkgname%-bin}-$pkgver-$arch.bz2"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_x86_64}.bz2")
source_aarch64=("${pkgname%-bin}-$pkgver-$arch.bz2"::"${url}/${pkgname}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_aarch64}.bz2")
source_aarch32=("${pkgname%-bin}-$pkgver-$arch.bz2"::"${url}/${pkgname}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_aarch32}.bz2")

prepare() {
  bzip2 -fdc ${pkgname%-bin}-$pkgver-$arch.bz2 > autorestic
  chmod +x autorestic
}

package() {
  mkdir -p "${pkgdir}/usr/local/bin/"
  cp "${srcdir}/autorestic" "${pkgdir}/usr/local/bin/autorestic"
}
