#Maintainer Ivan Porto Carrero <ivan@flanders.co.nz> (@casualjim)
pkgname=go-swagger
pkgver=0.9.0
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
sha256sums_i686=('2d641c8807e23c3be59a07240bc93789067c35d25b78398ac2f46ed34b538be8')
sha256sums_x86_64=('63d07f6c46cd5ba4ffad5eef5cc48997176a5a33ed62bfda9208188467586056')

package() {
  install -d ${pkgdir}/usr/bin
  if test "$CARCH" == i686; then
    install -Tm755 ${srcdir}/swagger_linux_386 ${pkgdir}/usr/bin/swagger
  else
    install -Tm755 ${srcdir}/swagger_linux_amd64 ${pkgdir}/usr/bin/swagger
  fi
}
