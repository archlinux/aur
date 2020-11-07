# Maintainer: Alessandro Ferrari <alessandroferry@protonmail.com>
pkgname=get-media-playing-git
pkgver=1.0.r2.6e8c903
pkgrel=1
epoch=
pkgdesc="Simple script to get the current media playing in the system. Useful in status bars"
arch=(x86_64)
url="https://github.com/Ferryistaken/get-media-playing.git"
license=('MIT')
groups=()
depends=(playerctl bash)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(get-media-playing)
conflicts=()
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
	cd "${_pkgname}"
	printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd get-media-playing
}

check() {
	echo "Remember to always read your PKGBUILDs before installing"
}

package() {
	cd get-media-playing
	install -D get-media-playing.sh ${pkgdir}/usr/bin/get-media-playing
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
