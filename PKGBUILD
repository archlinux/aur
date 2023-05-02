# Maintainer: pkg_maintainer <archlinuxpackagemaintainer@gmail.com>
pkgname=tplay-git
pkgver=0.3.1.1.r104.7636250
pkgrel=1
epoch=
pkgdesc="A terminal ASCII media player. View images, gifs, videos, webcam, YouTube, etc.. directly in the terminal as ASCII art."
arch=('x86_64')
url="https://github.com/maxcurzi/tplay.git"
license=('GPL3')
groups=()
depends=(yt-dlp opencv clang mpv ffmpeg)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(tplay-git)
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd tplay
	printf "0.3.1.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd tplay
	cargo build -r
}

package() {
	cd tplay
	install -Dm755 target/release/tplay "${pkgdir}/usr/bin/tplay"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
