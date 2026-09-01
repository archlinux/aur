# Maintainer: Mike Cuche <mike@cuche.cc>

pkgname=dosbox-x
pkgver=2026.08.31
pkgrel=1
pkgdesc="x86 emulator with builtin DOS, with patches with more features"
arch=(i686 x86_64 aarch64)
url="http://dosbox-x.com"
license=(GPL)
depends=(fluidsynth libxkbfile libpng libxrandr mesa ffmpeg physfs libslirp libpcap)
makedepends=(glu)
optdepends=('openglide-git: Third-party 3dfx Glide API support')
conflicts=(dosbox-x-git)
source=(https://github.com/joncampbell123/dosbox-x/archive/dosbox-x-v${pkgver}.tar.gz)

#prepare() {
#  cd $srcdir/dosbox-x-dosbox-x-v${pkgver}
#}

build() {
  cd $srcdir/dosbox-x-dosbox-x-v${pkgver}
  
  sed -i -e 's/-j3/-j$(nproc)/g' build
  ./build
}

package() {
  cd $srcdir/dosbox-x-dosbox-x-v${pkgver}
  make DESTDIR="${pkgdir}" install
}
sha256sums=('992ea538ea858f9fb196b39de2276ce3048c731965e144e6288202abed109782')
