# Maintainer: Gleb Sinyavskiy <zhulik.gleb@gmail.com>

pkgname=gickup
pkgver=0.9.6
pkgrel=1
pkgdesc='Backup tool for you cloud git repositories'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/cooperspencer/gickup'
license=('APACHE')
depends=('glibc')
makedepends=('go' )
source=("https://github.com/cooperspencer/${pkgname}/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('a06d1d8942b12cee348f161a36e104e98e93eb93f1f2fda9a3158e7785a93dd6')

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
