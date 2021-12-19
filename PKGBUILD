# Maintainer: Gleb Sinyavskiy <zhulik.gleb@gmail.com>

pkgname=gickup
pkgver=0.9.8.2
_pkgver=0.9.8-2
pkgrel=1
pkgdesc='Backup tool for you cloud git repositories'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/cooperspencer/gickup'
license=('APACHE')
depends=('glibc')
makedepends=('go' )
source=("https://github.com/cooperspencer/${pkgname}/archive/v${_pkgver}/${pkgname}-v${_pkgver}.tar.gz")
sha256sums=('16e63505c52dced4285a7db0f4ba3d70f66c6e65f828b816f55695f56e100089')

prepare() {
  cd "${pkgname}-${_pkgver}"
  mkdir -p build/
}

build() {
  cd "${pkgname}-${_pkgver}"
  go build -o build
}

package() {
  install -D -m755 "${srcdir}/${pkgname}-${_pkgver}/build/gickup" "${pkgdir}/usr/bin/gickup"
}
