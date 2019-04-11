# Mantainer: Michele Bovo <mbovo@gmx.com>

pkgname=dosbox-x
pkgver=0.82.17
pkgrel=1
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
  cd "$SRCDEST/src/dosbox-x-dosbox-x-v${pkgver}"
  ./build
}

package() {
  cd "$SRCDEST/src/dosbox-x-dosbox-x-v${pkgver}"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/dosbox-x.png" \
	"$pkgdir/usr/share/pixmaps/dosbox-x.png"
  install -Dm644 "$srcdir/dosbox-x.desktop" \
	"$pkgdir/usr/share/applications/dosbox-x.desktop"
}

md5sums=('39b8ffbdeb5e731ac37d98b0f978811a'
         '3dcfe45c5ed0433316eaea51e3620b36'
	 '615228a51b52d4788c73940602f1dc97')
