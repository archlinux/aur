# Contributor: Ivan Semkin (ivan at semkin dot ru)
# Contributor: Anatol Pomozov

_pkgname=bootimg-tools
pkgname=bootimg-tools-git
pkgver=r11.a7540ac
pkgrel=1
pkgdesc='Android boot.img creation and extraction tools'
url='https://github.com/pbatard/bootimg-tools'
license=(Apache)
arch=(x86_64)
depends=(glibc)
makedepends=(git)
conflicts=(android-tools)
source=(git://github.com/pbatard/bootimg-tools)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$_pkgname"
  make
}

package() {
  install -m755 -d "$pkgdir/usr/bin"
  install -m755 -t "$pkgdir/usr/bin" bootimg-tools/mkbootimg/{mkbootimg,unmkbootimg}
}
