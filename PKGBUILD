pkgbase="autorestic-bin"
pkgname="autorestic"
pkgver=1.0.7
_pkgid="${pkgname}-${pkgver}"
pkgrel=1
pkgdesc="High level CLI utility for restic"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="https://github.com/cupcakearmy/${pkgname}"
license=('Apache')

_arch_i686="386"
_arch_x86_64="amd64"
_arch_armv6h="arm"
_arch_armv7h="arm64"

sha256sums_x86_64=('c7fe7da7dbcbfcc1f46bfbcf9d79a9de16978470f4fd6e33e5aab8c7eb2126f0')
sha256sums_i686=('bb65eb5de9bebe8a3b8f8732d088e2b6e528a9dcc7ffdc421898000bc30cfc46')
sha256sums_armv6h=('b21e90a772871d3f17825e9dc97d70dbe54ec541c61806257b2cd263e54c8240')
sha256sums_armv7h=('43622d9bcace3a73562ea5c518f3bdff694e975d57f305567de61492f261c6fe')

source_x86_64=("$pkgname-$pkgver.bz2"::"https://github.com/cupcakearmy/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_${_arch_x86_64}.bz2")
source_i686=("$pkgname-$pkgver.bz2"::"https://github.com/cupcakearmy/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_${_arch_i686}.bz2")
source_armv6h=("$pkgname-$pkgver.bz2"::"https://github.com/cupcakearmy/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_${_arch_armv6h}.bz2")
source_armv7h=("$pkgname-$pkgver.bz2"::"https://github.com/cupcakearmy/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_${_arch_armv7h}.bz2")

prepare() {
  bzip2 -fdc $pkgname-$pkgver.bz2 > autorestic
  chmod +x autorestic
}

package() {
  mkdir -p "${pkgdir}/usr/local/bin/"
  cp "${srcdir}/autorestic" "${pkgdir}/usr/local/bin/autorestic"
}
