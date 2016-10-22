# Contributor: Patrick Bartels <pckbls@gmail.com>

pkgname=pulseaudio-module-sndio
pkgdesc="Pulseaudio module for sndio support"
pkgver=r10.0a732e0
pkgrel=1
arch=(i686 x86_64)
url="https://github.com/t6/pulseaudio-module-sndio"
license=(BSD)
depends=(pulseaudio sndio)
source=("$pkgname::git+https://github.com/t6/pulseaudio-module-sndio.git#commit=0a732e03309c0a8b1632286a46bdc39733845f68")
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
  STAGEDIR="$pkgdir" make install
}

