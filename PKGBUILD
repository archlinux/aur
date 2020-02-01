# Maintainer: Michele Bovo <mbovo@gmx.com>

pkgname=dosbox-x
pkgver=0.82.26
srcver=0.82.86
pkgrel=2
pkgdesc="x86 emulator with builtin DOS, with patches with more features"
arch=(i686 x86_64)
url="http://dosbox-x.com"
license=(GPL)
depends=(fluidsynth libxkbfile libpng libxrandr mesa ffmpeg)
makedepends=(glu)
optdepends=()
conflicts=(dosbox-x-git)
source=(https://github.com/joncampbell123/dosbox-x/archive/dosbox-x-v${srcver}.tar.gz
		dosbox-x.png
		dosbox-x.desktop)
sha256sums=('cf6f6054f191d275d72a67fc664226b56444777bf6df464e2a9977339ebcf6f0'
			'caa164f3d17d414733882d29098cb9cd63faddbdd5580a0c30f1173a63c42475'
			'32f290580ec02dedd09908d8a4de10f57b94998f2c1eb597b649208cd87b2d33')

build() {
  cd $srcdir/dosbox-x-dosbox-x-v${srcver}
  ./build
}

package() {
  cd $srcdir/dosbox-x-dosbox-x-v${srcver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/dosbox-x.png" \
	"${pkgdir}/usr/share/pixmaps/dosbox-x.png"
  install -Dm644 "${srcdir}/dosbox-x.desktop" \
	"${pkgdir}/usr/share/applications/dosbox-x.desktop"
}
