pkgname="autorestic-bin"
pkgver=1.1.0
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
_arch_aarch32="arm"
_arch_aarch64="arm64"

sha256sums_i686=('ac3a477784972fb51a7f0357fb423f17d675a49b0e744d5ad44602c668bf91fb')
sha256sums_x86_64=('4fe431ed75ac03aa12a4e85b3b6c144bafcc0a43ead8695d19bbec61aa35e7eb')
sha256sums_aarch64=('782b99beb7649fddb70a6235fd60362928d2192146f3827519725e0c2f100faa')
sha256sums_aarch32=('0c6f15804f739504f31e6adf389df3a54ceb99e7d9afc3a829909084e7e3a419')

source_i686=("${pkgname%-bin}-$pkgver.bz2"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_i686}.bz2")
source_x86_64=("${pkgname%-bin}-$pkgver.bz2"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_x86_64}.bz2")
source_aarch64=("${pkgname%-bin}-$pkgver.bz2"::"${url}/${pkgname}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_aarch64}.bz2")
source_aarch32=("${pkgname%-bin}-$pkgver.bz2"::"${url}/${pkgname}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_${_arch_aarch32}.bz2")

prepare() {
  bzip2 -fdc ${pkgname%-bin}-$pkgver.bz2 > autorestic
  chmod +x autorestic
}

package() {
  mkdir -p "${pkgdir}/usr/local/bin/"
  cp "${srcdir}/autorestic" "${pkgdir}/usr/local/bin/autorestic"
}
