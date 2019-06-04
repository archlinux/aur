# Mantainer: Michele Bovo <mbovo@gmx.com>

pkgname=dosbox-x
pkgver=0.82.19
pkgrel=2
pkgdesc="x86 emulator with builtin DOS, with patches with more features"
arch=(i686 x86_64)
url="http://dosbox-x.com"
license=(GPL)
depends=(fluidsynth libxkbfile libpng libxrandr mesa ffmpeg)
makedepends=(git glu)
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

sha1sums=('f7a23eb515f4e162dd1ca22bd860ccfaabfaba93'
         'fa54fcde17bc641fb772cdf595771ff6813d2250'
	 '7501e53de8053900f5871f14afa3abf6cfbc64d7')
