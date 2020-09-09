# Maintainer: Ricardo Constantino <wiiaboo@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Miroslaw Szot <mss@czlug.icis.pcz.pl>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgbase=nginx
pkgname=nginx-mainline-src
pkgver=1.19.2
pkgrel=1

_pkgver="$(/bin/nginx -v 2>&1 | /bin/grep -Eo '([[:digit:]]|\.)+')"

pkgdesc="Source code of nginx-mainline $_pkgver, useful for building modules"
arch=(x86_64)
url='https://nginx.org'
license=(custom)
depends=()
makedepends=(nginx grep)
source=($url/download/nginx-$_pkgver.tar.gz{,.asc})
validpgpkeys=(B0F4253373F8F6F510D42178520A9993A1C052F8) # Maxim Dounin <mdounin@mdounin.ru>
md5sums=('3dc55f6451ed6f819f1c796f4e5e9617'
         'SKIP')

pkgver() {
  printf '%s\n' "$_pkgver"
}

package() {
  install -d "$pkgdir/usr/src"
  cp -r $pkgbase-$_pkgver "$pkgdir/usr/src/nginx-mainline"
}
