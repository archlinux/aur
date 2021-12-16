# Maintainer: Gleb Sinyavskiy <zhulik.gleb@gmail.com>

pkgname=gickup
pkgver=0.9.8
pkgrel=1
pkgdesc='Backup tool for you cloud git repositories'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/cooperspencer/gickup'
license=('APACHE')
depends=('glibc')
makedepends=('go' )
source=("https://github.com/cooperspencer/${pkgname}/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('00aa14d42431e4f2ed9811a8c9f07b2a2a4db4869ad1055283b8e6b0a84433ce')

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
