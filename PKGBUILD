# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=dispmanx_vnc
pkgver=21fa4e9
pkgrel=1
pkgdesc="VNC Server for Raspberry Pi using dispmanx"
arch=('armv7h')
url="https://github.com/hanzelpeter/dispmanx_vnc"
license=('MIT')
depends=('libvncserver')
makedepends=('git')
source=("git://github.com/hanzelpeter/dispmanx_vnc")
md5sums=('SKIP')

# Note the license is currently unknow pending a reply from upstream
# https://github.com/hanzelpeter/dispmanx_vnc/issues/14

pkgver() {
  cd "$pkgname"
  git describe --always | sed 's|-|.|g'
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
