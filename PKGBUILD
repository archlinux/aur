# Maintainer: Josh Wright <wright.jjw@gmail.com>
pkgname=dwm-wrightjjw-git
pkgver=6.2
pkgrel=1
pkgdesc="Josh's build of suckless dwm"
arch=('x86_64')
url="https://github.com/wrightjjw/dwm"
license=('MIT')
depends=(dmenu freetype2 libx11 libxft-bgra libxinerama st flameshot ttf-cascadia-code)
provides=(dwm)
conflicts=(dwm)
source=("git+$url")
md5sums=("SKIP")

pkgver() {
	cd dwm
	printf "6.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd dwm
	make
}

package() {
	cd dwm
	make PREFIX="$pkgdir/usr" install
}
