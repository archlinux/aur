# Maintainer: Gleb Sinyavskiy <zhulik.gleb@gmail.com>

pkgname=gickup
pkgver=0.9.4
pkgrel=1
pkgdesc='Backup tool for you cloud git repositories'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/cooperspencer/gickup'
license=('APACHE')
depends=('glibc')
makedepends=('go' )
source=("https://github.com/cooperspencer/${pkgname}/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('c6453b2bb3f8210bc53fd824e885d627e881b93452a6519630fa11455d2d14c4')

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build/
}

build() {
  cd "${pkgname}-${pkgver}"
  go build -o build
}

package() {
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}/build/gickup" "${pkgdir}/usr/bin/gickup"
}
