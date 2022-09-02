# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname="master_me"
pkgver=1.0.0
pkgrel=1
pkgdesc='A modern graphical patchbay for JACK'
arch=(x86_64)
url='https://github.com/trummerschlunk/master_me'
license=(GPL3)
depends=(gcc-libs glibc libxcursor libxrandr)
makedepends=(faustpp libglvnd libpulse sdl2)
groups=(lv2-plugins pro-audio vst-plugins vst3-plugins)
optdepends=('jack: stand-alone JACK application'
            'libpulse: stand-alone JACK application'
            'sdl2: stand-alone JACK application')
source=("https://github.com/trummerschlunk/master_me/releases/download/1.0.0/master_me-1.0.0.tar.xz")
sha256sums=('97f3d640eadcdfee7946a40276f64620b1622235e8dc5f704617ccb599459bc6')


build() {
  cd $pkgname-$pkgver
  make VERBOSE=1
}

package() {
  depends+=(libGL.so)
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
