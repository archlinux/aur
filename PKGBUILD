# Maintainer: Apoorv <apoorvs569@gmail.com>

pkgname=bolliedelayxt.lv2-git
pkgver=r44.4f6b8aa
pkgrel=2
pkgdesc="A lv2 delay plugin"
arch=('x86_64')
url="https://github.com/MrBollie/bolliedelayxt.lv2"
license=('GPL3')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make -j4
}

package() {
  cd "$srcdir/${pkgname%-git}"
  mkdir -p "${pkgdir}/usr/lib/lv2/"
  cp -r build/bolliedelayxt.lv2/ "${pkgdir}/usr/lib/lv2/"
}
