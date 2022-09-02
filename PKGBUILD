#Maintainer Ivan Porto Carrero <ivan@flanders.co.nz> (@casualjim)
pkgname=go-swagger-bin
pkgver=0.30.2
pkgrel=1
pkgdesc="Toolkit for swagger in golang (go-swagger)"
arch=('x86_64' "aarch64" "arm7h")
groups=('swagger')
provides=('swagger')
conflicts=('swagger')
url="https://goswagger.io"
license=("ASL 2.0")

source_x86_64=("swagger_linux_amd64_${pkgver}::https://github.com/go-swagger/go-swagger/releases/download/v${pkgver}/swagger_linux_amd64")
sha256sums_x86_64=('767b79fdb84aaf0da67a24b358d7d3ff298788e27095255f1cae08057bde7508')
source_aarch64=("swagger_linux_arm64_${pkgver}::https://github.com/go-swagger/go-swagger/releases/download/v${pkgver}/swagger_linux_arm64")
sha256sums_aarch64=('2fc9a8a49be96fca6ebd228432a5abb77b40a264ac47f1b76a3e444088b772c4')
source_armv7h=("swagger_linux_arm_${pkgver}::https://github.com/go-swagger/go-swagger/releases/download/v${pkgver}/swagger_linux_arm")
sha256sums_armv7h=('c097e3ed89319c7505e44cebb72431f7c937c39c8593e2897d492540668c1175')

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

