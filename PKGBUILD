#Maintainer Ivan Porto Carrero <ivan@flanders.co.nz> (@casualjim)
pkgname=go-swagger
pkgver=0.7.4
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
sha256sums_i686=('6ddcbebffacec0e72a366f178e553ee035bebf834b65b74f30d0bf63dbc54bd8')
sha256sums_x86_64=('9a8f0807f242ea2b8766c151a68aeb5dacc632e4f4aeeb1adce0065f9ab4d9b5')

package() {
  install -d ${pkgdir}/usr/bin
  if test "$CARCH" == i686; then
    install -Tm755 ${srcdir}/swagger_linux_386 ${pkgdir}/usr/bin/swagger
  else
    install -Tm755 ${srcdir}/swagger_linux_amd64 ${pkgdir}/usr/bin/swagger
  fi
}
