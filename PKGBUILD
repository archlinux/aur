# Maintainer: Jerry Xiao <aur at mail.jerryxiao.cc>

pkgname=xkbcat
pkgver=2.1.1
pkgrel=2
pkgdesc="simple sudoless X11 keylogger"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/anko/xkbcat"
license=('ISC')
depends=('libxi')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8a2e39c49c156c4131c3271207ba8910b6a3b70023f70161995f1eb04941f2eb')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 "xkbcat" "${pkgdir}/usr/bin/xkbcat"
}
