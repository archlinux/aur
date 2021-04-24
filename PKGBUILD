pkgbase="autorestic-bin"
pkgname="autorestic"
pkgver=1.0.5
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

sha256sums_x86_64=('2f2297546e00cfec1367817f866c75b09ffbff91e9fee41cfa9986bb7771677e')
sha256sums_i686=('a9cb66d3d2081fec059d86c3e46714e917f71177c58bb1b0571e9b2061d2fb4d')
sha256sums_armv6h=('39f18ad97915773d75102900b5d1cf194e35c0a0a7d7d9a9291c06c2269db79f')
sha256sums_armv7h=('4a8c8ad3f1187f0ab3cf836b8b4ca9a99b0117009b5beffb0961097f133b2e19')

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
