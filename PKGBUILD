pkgname="autorestic-bin"
pkgver=1.5.5
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

sha256sums_x86_64=('d83c3e54e5094e60a67fcf74fa34f9e82647191ddd5234d26b288145a7cc5788')
sha256sums_i686=('d7870bc7f7c68d1656100a152189fc2b9bb4a51887abcb00fa69a0d1e9356af8')
sha256sums_aarch32=('c04c1e8c02bc1cf6ec4bfc040d27302faffb04966d24157982c92f53e82be47f')
sha256sums_aarch64=('1493ffc206702efa9712f0ece691e2663b3d34f163b48242180bb1f52e164543')

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
