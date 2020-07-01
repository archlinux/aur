# Maintainer: donarturo <arturwrona91 (at) gmail (dot) com>
pkgname=gmsynth-fluidr3
_pkgname=gmsynth-fluidr3.lv2
pkgver=r2.b784b19
pkgrel=1
pkgdesc="General MIDI LV2 Synth (FluidR3). Modified version of gmsynth from x42 with FluidR3"
arch=('x86_64')
url="https://github.com/donarturo11/gmsynth-fluidr3.lv2"
license=('GPL2')
groups=('pro-audio' 'lv2-plugins')
depends=('glibc' 'glib2' 'libfluidsynth.so')
makedepends=('lv2' 'git')
source=("https://www.dropbox.com/s/jqv7iszl5diiehx/gmsynth-fluidr3-lv2.tar.gz")
sha512sums=('SKIP')


build() {
  cd "${_pkgname}"
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="$pkgdir/" PREFIX='/usr' install
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
