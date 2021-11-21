pkgname="autorestic-bin"
pkgver=1.5.0
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

sha256sums_x86_64=('823c4b766f289d5d1a40fea52a6f4f1fbd4071ca6e57c74b88e57e0649cbaeaf')
sha256sums_i686=('c74c80c9819f54fc03c0e95d8be1b2eff9ebc497606f45c232ae8f16d6087bfd')
sha256sums_aarch32=('7554ea56614fa0b82955e7a4eef347bcec74d607deea927b4e070eaef5d82247')
sha256sums_aarch64=('d9f22872b6ee6f3ca5bf6cb8f3d34bdc05cec8e99d016bbaa1e5538342638ce2')

source_i686=("${pkgname%-bin}-${pkgver}-$arch.bz2"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_i686}.bz2")
source_x86_64=("${pkgname%-bin}-${pkgver}-$arch.bz2"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_x86_64}.bz2")
source_aarch64=("${pkgname%-bin}-${pkgver}-$arch.bz2"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_aarch64}.bz2")
source_aarch32=("${pkgname%-bin}-${pkgver}-$arch.bz2"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_aarch32}.bz2")

prepare() {
  bzip2 -fdc ${pkgname%-bin}-${pkgver}-$arch.bz2 > autorestic
  chmod +x autorestic
}

package() {
  mkdir -p "${pkgdir}/usr/local/bin/"
  cp "${srcdir}/autorestic" "${pkgdir}/usr/local/bin/autorestic"
}
