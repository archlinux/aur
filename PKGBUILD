#Maintainer Ivan Porto Carrero <ivan@flanders.co.nz> (@casualjim)
pkgname=go-swagger
pkgver=0.17.1
pkgrel=1
pkgdesc="Toolkit for swagger in golang (go-swagger)"
arch=('i686' 'x86_64')
groups=('swagger')
provides=('swagger')
conflicts=('swagger')
url="https://goswagger.io"
license=("ASL 2.0")

source_i686=("swagger_linux_386_${pkgver}::https://github.com/go-swagger/go-swagger/releases/download/v${pkgver}/swagger_linux_386")
source_x86_64=("swagger_linux_amd64_${pkgver}::https://github.com/go-swagger/go-swagger/releases/download/v${pkgver}/swagger_linux_amd64")
sha256sums_i686=('712b8a9eb3aae96c9a0f8e2b19d80dafe04ad639ab258d9767b67c41444e6121')
sha256sums_x86_64=('b6e2f851a5fc7c3a481715c668a9f65c98961b256b53379c064cf49b94784de7')

package() {
  install -d ${pkgdir}/usr/bin
  if test "$CARCH" == i686; then
    install -Tm755 "${srcdir}/swagger_linux_386_${pkgver}" "${pkgdir}/usr/bin/swagger"
  else
    install -Tm755 "${srcdir}/swagger_linux_amd64_${pkgver}" "${pkgdir}/usr/bin/swagger"
  fi
}
