# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=dispmanx_vnc
pkgver=r37.0c1d528
pkgrel=1
pkgdesc="VNC Server for Raspberry Pi using dispmanx"
arch=(armv7h)
url="https://github.com/hanzelpeter/dispmanx_vnc"
license=(MIT)
depends=(libvncserver raspberrypi-firmware)
makedepends=(git)
source=("git+https://github.com/hanzelpeter/dispmanx_vnc")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -Dm755 dispmanx_vncserver "$pkgdir"/usr/bin/dispmanx_vncserver
  install -Dm644 MIT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
