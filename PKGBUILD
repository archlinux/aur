# Maintainer: Anima

pkgname=video-compare-git
pkgver=20230807.r37.g369fa6f
pkgrel=2
epoch=
pkgdesc="Split screen video comparison tool using FFmpeg and SDL2 "
arch=('x86_64')
url="https://github.com/pixop/video-compare"
license=('GPL')
groups=()
depends=('ffmpeg' 'sdl2' 'sdl2_ttf')
makedepends=('git')
checkdepends=()
optdepends=()
provides=('video-compare')
conflicts=('video-compare')
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+https://github.com/pixop/video-compare.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

pkgver() {
  cd "${pkgname}"
  printf "%s" "$(git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	install -Dm755 -t "$pkgdir/usr/bin" "$srcdir/$pkgname/video-compare"
}