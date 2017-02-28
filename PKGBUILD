# Maintainer: Carlo Capocasa <carlo@capocasa.net>
pkgname=nanotts
pkgver=r46.2370600
pkgrel=1
epoch=
pkgdesc="The Cainteoir Text-To-Speach Engine"
arch=(x86_64)
url="https://github.com/rhdunn/cainteoir-engine"
license=('GPL')
groups=()
depends=()
makedepends=(python2-yaml)
checkdepends=()
optdepends=(pulseaudio alsa-lib libvorbis espeak svox-pico-bin poppler ffmpeg libavutil libavcodec libavformat libavresample)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
"$pkgname::git+https://github.com/gmn/nanotts.git#branch=master"
)
noextract=()
md5sums=(
"SKIP"
)
validpgpkeys=()

prepare() {
	cd "$pkgname"
}

build() {
	cd "$pkgname"
	make
}

check() {
	cd "$pkgname"
}

package() {
	dir="$pkgdir/opt/$pkgname"
  mkdir -p "$dir"
  cp "$pkgname/$pkgname" "$dir"
  cp -R "$pkgname/lang" "$dir" 
  mkdir -p "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin"
  ln -s "../../opt/$pkgname/$pkgname"
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

