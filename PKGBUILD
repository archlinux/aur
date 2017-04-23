#Maintainer Ivan Porto Carrero <ivan@flanders.co.nz> (@casualjim)
pkgname=go-swagger
pkgver=0.10.0
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
sha256sums_i686=('597d62d380264efcc54e75cf1e3ed233df54f2abbe9f0cdd58529298b986e9e9')
sha256sums_x86_64=('68033b4271e6113c727ad2aaf86235b74b77c8ff2ca73213ee1e9c08f1b9aeff')

package() {
  install -d ${pkgdir}/usr/bin
  if test "$CARCH" == i686; then
    install -Tm755 ${srcdir}/swagger_linux_386 ${pkgdir}/usr/bin/swagger
  else
    install -Tm755 ${srcdir}/swagger_linux_amd64 ${pkgdir}/usr/bin/swagger
  fi
}
