#Maintainer Ivan Porto Carrero <ivan@flanders.co.nz> (@casualjim)
pkgname=go-swagger
pkgver=0.14.0
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
sha256sums_i686=('26b86ef6aec2679e3711d874cf19cadfa2ef14c720f8d2716c522467899740f4')
sha256sums_x86_64=('1584a00dc8de96940b9084a478438b2d82108438e07da3ca3cc9f44eb2a79b5a')

package() {
  install -d ${pkgdir}/usr/bin
  if test "$CARCH" == i686; then
    install -Tm755 ${srcdir}/swagger_linux_386 ${pkgdir}/usr/bin/swagger
  else
    install -Tm755 ${srcdir}/swagger_linux_amd64 ${pkgdir}/usr/bin/swagger
  fi
}
