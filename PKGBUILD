#Maintainer Ivan Porto Carrero <ivan@flanders.co.nz> (@casualjim)
pkgname=go-swagger-bin
pkgver=0.30.3
pkgrel=1
pkgdesc="Toolkit for swagger in golang (go-swagger)"
arch=('x86_64' "aarch64" "arm7h")
groups=('swagger')
provides=('swagger')
conflicts=('swagger')
url="https://goswagger.io"
license=("ASL 2.0")

source_x86_64=("swagger_linux_amd64_${pkgver}::https://github.com/go-swagger/go-swagger/releases/download/v${pkgver}/swagger_linux_amd64")
sha256sums_x86_64=('73dc1bad84c26ad5e44d85ccff89a26efccf422ef7f291f01ae6dc11b3b22d31')
source_aarch64=("swagger_linux_arm64_${pkgver}::https://github.com/go-swagger/go-swagger/releases/download/v${pkgver}/swagger_linux_arm64")
sha256sums_aarch64=('670a81668e1c84f0db678a64f8b940bfe288640a3dbbf105a37db75d1ddf1f48')
source_armv7h=("swagger_linux_arm_${pkgver}::https://github.com/go-swagger/go-swagger/releases/download/v${pkgver}/swagger_linux_arm")
sha256sums_armv7h=('ec44a00bc60ac3565dd64b1c2b89f9ae4bed4deaad0dbc5b5219edc412636dc8')

package() {
  install -d "${pkgdir}/usr/bin"
  
  case "$CARCH" in 
    x86_64)
      install -Tm755 swagger_linux_amd64_${pkgver} "$pkgdir/usr/bin/swagger"
      ;;
    aarch64)
      install -Tm755 swagger_linux_arm64_${pkgver} "$pkgdir/usr/bin/swagger"
      ;;
    armv7h)
      install -Tm755 swagger_linux_arm_${pkgver} "$pkgdir/usr/bin/swagger"
      ;;
  esac
}

