# Maintainer: Jerry Xiao <aur at mail.jerryxiao.cc>

pkgname=xkbcat
pkgver=2.2.1
pkgrel=1
pkgdesc="simple sudoless X11 keylogger"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/anko/xkbcat"
license=('ISC')
depends=('libxi')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5128255cdc50cdbd75fdbcb5efec146e4770d2c209ec6f953e4852caab9be840')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 "xkbcat" "${pkgdir}/usr/bin/xkbcat"
}
