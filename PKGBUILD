#Maintainer Ivan Porto Carrero <ivan@flanders.co.nz> (@casualjim)
pkgname=go-swagger
pkgver=0.18.0
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
sha256sums_i686=('8a01c473d1ca1ad60094977c2e79d4f6289a7a419fd37bafea5bdd6c89f2186c')
sha256sums_x86_64=('ff0f9429128163fd7bd1f510d83c9b55af75c5507f731aed47878d6b1a2a75a5')

package() {
  install -d ${pkgdir}/usr/bin
  if test "$CARCH" == i686; then
    install -Tm755 "${srcdir}/swagger_linux_386_${pkgver}" "${pkgdir}/usr/bin/swagger"
  else
    install -Tm755 "${srcdir}/swagger_linux_amd64_${pkgver}" "${pkgdir}/usr/bin/swagger"
  fi
}
