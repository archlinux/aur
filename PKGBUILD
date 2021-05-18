pkgname="autorestic-bin"
pkgver=1.1.1
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

sha256sums_i686=('62d7176b014102e19ae69e625a6dc8b49f16b03741bb2f79613f57b6116f3d53')
sha256sums_x86_64=('530b4179fcbf402c05150ad0352fd0d9e78f428bba71ecf60279055e14f6f951')
sha256sums_aarch64=('d6de1d43d400aa7baa93ceeb323a8d2294a9a5915f079ac974d481fbb1eb82f2')
sha256sums_aarch32=('a50079b3498e79021a8e1175207715ad96e4c2e7cc50ee01de8e11314a960eec')

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
