# Maintainer: Michele Bovo <mbovo@gmx.com>

pkgname=dosbox-x
pkgver=0.82.23
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

build() {
  cd dosbox-x-dosbox-x-v${pkgver}
  ./build
}

package() {
  cd dosbox-x-dosbox-x-v${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/dosbox-x.png" \
	"${pkgdir}/usr/share/pixmaps/dosbox-x.png"
  install -Dm644 "${srcdir}/dosbox-x.desktop" \
	"${pkgdir}/usr/share/applications/dosbox-x.desktop"
}

sha1sums=('0781e9b74ed2505904f5706182285250f2f19628'
         'fa54fcde17bc641fb772cdf595771ff6813d2250'
	 '7501e53de8053900f5871f14afa3abf6cfbc64d7')
