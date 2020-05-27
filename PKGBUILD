# Maintainer: Syaoran Code <syaorancode@gmail.com>
pkgname=dwmblocks-syaoran-git
pkgver=0.1r1.c2bc30a
pkgrel=1
epoch=
pkgdesc="dwmblocks for dwm"
arch=(x86_64)
url="https://gitlab.com/justanoobcoder/dwmblocks.git"
license=('MIT')
groups=()
depends=(libx11 libxft-bgra-git bc pacman-contrib)
makedepends=(make)
checkdepends=()
optdepends=()
provides=(dwmblocks)
conflicts=(dwmblocks)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd "dwmblocks"
    printf "0.1r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "dwmblocks"
	make > /dev/null
}

package() {
	cd "dwmblocks"
	make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
