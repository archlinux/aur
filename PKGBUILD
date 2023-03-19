# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=google-earth-pro-libproxy-patch
pkgver=0.4.17_7
_pkgver=$(echo ${pkgver} | sed 's/_/-/')
pkgrel=1
pkgdesc="Patch your Google Earth Pro installation with a libproxy library that's known to work."
arch=("x86_64")
url="https://archive.archlinux.org/packages/l/libproxy"
license=("LGPL")
depends=('google-earth-pro')
source=("${url}/libproxy-${_pkgver}-x86_64.pkg.tar.zst")
sha512sums=('b3b6ac4b35010bb67cb4915abe06c7351f97bdc42ed93c7f8113eb8966750fc442f1e8ff77e701c0478a90fa6aec64b04f618034369988a1fe5681830593518d')
install="notify.install"

package() {
  cd ${srcdir}
  install -Dm755 "usr/lib/libproxy.so.1.0.0" "${pkgdir}/opt/google/earth/pro/libproxy.so.1"
}
