#Maintainer Ivan Porto Carrero <ivan@flanders.co.nz> (@casualjim)
pkgname=go-swagger
pkgver=0.12.0
pkgrel=1
pkgdesc="Toolkit for swagger in golang (go-swagger)"
arch=('i686' 'x86_64')
groups=('swagger')
provides=('swagger')
conflicts=('swagger')
url="https://goswagger.io"
license=("ASL 2.0")

source_i686=("https://github.com/go-swagger/go-swagger/releases/download/${pkgver}/swagger_linux_386")
source_x86_64=("https://github.com/go-swagger/go-swagger/releases/download/${pkgver}/swagger_linux_amd64")
sha256sums_i686=('1392340c5ea90f50cb984cd2025bdcec3275c0cdc24c2e6aa81de4164f223d8c')
sha256sums_x86_64=('fbf3d8220834eb222ce328f01ff85c533378de156fe60a276f1eceae04c65207')

package() {
  install -d ${pkgdir}/usr/bin
  if test "$CARCH" == i686; then
    install -Tm755 ${srcdir}/swagger_linux_386 ${pkgdir}/usr/bin/swagger
  else
    install -Tm755 ${srcdir}/swagger_linux_amd64 ${pkgdir}/usr/bin/swagger
  fi
}
