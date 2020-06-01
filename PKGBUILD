# Maintainer: Mike Cuche <cuche@gmx.com>

pkgname=dosbox-x
pkgver=0.83.2
pkgrel=1
pkgdesc="x86 emulator with builtin DOS, with patches with more features"
arch=(i686 x86_64)
url="http://dosbox-x.com"
license=(GPL)
depends=(fluidsynth libxkbfile libpng libxrandr mesa ffmpeg)
makedepends=(glu)
optdepends=()
conflicts=(dosbox-x-git)
source=(https://github.com/joncampbell123/dosbox-x/archive/dosbox-x-v${pkgver}.tar.gz
		dosbox-x.png
		dosbox-x.desktop)
sha256sums=('87cfdf515b6c5a71afb3f5b1960d5cd323a0cce5643094713db3cf2ccb82b4bc'
			'caa164f3d17d414733882d29098cb9cd63faddbdd5580a0c30f1173a63c42475'
			'32f290580ec02dedd09908d8a4de10f57b94998f2c1eb597b649208cd87b2d33')

build() {
  cd $srcdir/dosbox-x-dosbox-x-v${pkgver}
  ./build
}

package() {
  cd $srcdir/dosbox-x-dosbox-x-v${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/dosbox-x.png" \
	"${pkgdir}/usr/share/pixmaps/dosbox-x.png"
  install -Dm644 "${srcdir}/dosbox-x.desktop" \
	"${pkgdir}/usr/share/applications/dosbox-x.desktop"
}
