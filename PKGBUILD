#Maintainer Ivan Porto Carrero <ivan@flanders.co.nz> (@casualjim)
pkgname=go-swagger
pkgver=0.16.0
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
sha256sums_i686=('5d0f79fdaee9d014918cf4aa0d1d9ba635f07a63b3da5b72e467224456397cce')
sha256sums_x86_64=('fa89ea1880ca9a866f7c8fbf025dd3eaf902f303395f91dbb2a70d52e5dcd798')

package() {
  install -d ${pkgdir}/usr/bin
  if test "$CARCH" == i686; then
    install -Tm755 "${srcdir}/swagger_linux_386_${pkgver}" "${pkgdir}/usr/bin/swagger"
  else
    install -Tm755 "${srcdir}/swagger_linux_amd64_${pkgver}" "${pkgdir}/usr/bin/swagger"
  fi
}
