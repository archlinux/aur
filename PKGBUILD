# Maintainer: Alexander Görtz <aur@nyloc.de>

pkgname=mod_xsendfile
pkgver=0.12
pkgrel=1
pkgdesc='Apache module for XSendFile header'
arch=('i686' 'x86_64')
url='https://github.com/nmaier/mod_xsendfile'
license=('Apache')
makedepends=('apache')
source=("https://github.com/nmaier/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('eb7e409e73ecd85aac94c818573e78e21a84a6bace08ef016b33e6e081fb76d9')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    apxs -c  mod_xsendfile.c
}  

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 .libs/mod_xsendfile.so "${pkgdir}/usr/lib/httpd/modules/mod_xsendfile.so"
}

