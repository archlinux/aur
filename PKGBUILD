#Maintainer Ivan Porto Carrero <ivan@flanders.co.nz> (@casualjim)
pkgname=go-swagger
pkgver=0.15.0
pkgrel=1
pkgdesc="Toolkit for swagger in golang (go-swagger)"
arch=('i686' 'x86_64')
groups=('swagger')
provides=('swagger')
conflicts=('swagger')
url="https://goswagger.io"
license=("ASL 2.0")

source_i686=("swagger_linux_386_${pkgver}::https://github.com/go-swagger/go-swagger/releases/download/${pkgver}/swagger_linux_386")
source_x86_64=("swagger_linux_amd64_${pkgver}::https://github.com/go-swagger/go-swagger/releases/download/${pkgver}/swagger_linux_amd64")
sha256sums_i686=('423a98d3f13d5d932655d79355b85d11baf8f3e09cf338d2b0c5b4023b19a087')
sha256sums_x86_64=('e9aa06140114882189b523e31d375027dbdc1c21a7723d40abb7408c7781ce72')

package() {
  install -d ${pkgdir}/usr/bin
  if test "$CARCH" == i686; then
    install -Tm755 "${srcdir}/swagger_linux_386_${pkgver}" "${pkgdir}/usr/bin/swagger"
  else
    install -Tm755 "${srcdir}/swagger_linux_amd64_${pkgver}" "${pkgdir}/usr/bin/swagger"
  fi
}
