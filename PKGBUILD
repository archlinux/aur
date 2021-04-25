pkgbase="autorestic-bin"
pkgname="autorestic"
pkgver=1.0.6
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

sha256sums_x86_64=('ca498e10be4b7e3920c62aad8c3547769c6b1fd983053418097cb7ec25d6972e')
sha256sums_i686=('9f9b2fa516a1a6975d38bbac1f74b06f17ebe839ed1cf6920b152250df78ba22')
sha256sums_armv6h=('a0a216b9ef40d47dbecd913837d68dc56558553afcbe31420a02ec2ffbad4de4')
sha256sums_armv7h=('bcb84e8f06998d568abecec852a35a63ff00a2c35d861103e3ee17080e8755fa')

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
