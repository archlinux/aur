# Contributor: Patrick Bartels <pckbls@gmail.com>

pkgname=pulseaudio-module-sndio
pkgdesc="Pulseaudio module for sndio support"
pkgver=r14.3d55962
pkgrel=1
arch=(x86_64)
url="https://github.com/t6/pulseaudio-module-sndio"
license=(BSD)
depends=(pulseaudio sndio)
source=("$pkgname::git+https://github.com/t6/pulseaudio-module-sndio.git#commit=3d559627a054ca0dccaa802354db1fe0da2e9ec6")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
} 

build() {
  cd "$pkgname"
  make
}

package(){
  cd "$pkgname"
  DESTDIR="$pkgdir" make install
}

