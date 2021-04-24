pkgname="autorestic-bin"
pkgver=1.0.4
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

sha256sums_x86_64=('3ebbd57dcbc2409b11869c9afff8657496c0bfd33aefd95e4b7e54686cb6fd84')
sha256sums_i686=('5e05e884eb4988ea75d0e00aec5b66b83d8f29492199396c537ada2ece4affe1')
sha256sums_armv6h=('10dbed83b50e343cf278b4742054bed1976530eef61436076116cf446c4632ed')
sha256sums_armv7h=('89a9a0e3d9594075ea856571e194dfda43566a295645c90d30827eca75d4bffe')

source_x86_64=("$pkgname-$pkgver.bz2"::"https://github.com/cupcakearmy/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_${_arch_x86_64}.bz2")
source_i686=("$pkgname-$pkgver.bz2"::"https://github.com/cupcakearmy/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_${_arch_i686}.bz2")
source_armv6h=("$pkgname-$pkgver.bz2"::"$https://github.com/cupcakearmy/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_${_arch_armv6h}.bz2")
source_armv7h=("$pkgname-$pkgver.bz2"::"$https://github.com/cupcakearmy/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_${_arch_armv7h}.bz2")

prepare() {
  bzip2 -fdc $pkgname-$pkgver.bz2 > autorestic
  chmod +x autorestic
}

package() {
  mkdir -p "${pkgdir}/usr/local/bin/"
  cp "${srcdir}/autorestic" "${pkgdir}/usr/local/bin/autorestic"
}
