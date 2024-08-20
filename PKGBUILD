# Maintainer: Ted Hahn <thahn@tcbtech.com>
pkgname=qxmoji
pkgver=0.7
pkgrel=1
# epoch=
pkgdesc="X11 emoji keyboard"
arch=("x86_64")
url="https://github.com/Zirias/qxmoji"
license=('BSD-2-Clause')
groups=()
depends=("noto-fonts-emoji")
makedepends=("git")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("qxmoji::git+https://github.com/Zirias/qxmoji.git#tag=v${pkgver}")
noextract=()
sha256sums=('31646caac6508c16384cd2041892105a60eb34b28eacee183cef5b545ccacc18')
validpgpkeys=()

# For building -git versions
# pkgver() {
#   cd "$pkgname"
#   # cutting off 'v' prefix that presents in the git tag
#   git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
# }

prepare() {
	cd "$pkgname"
  git submodule update --init
}

build() {
	cd "$pkgname"

	make
}

check() {
	cd "$pkgname"
	# make -k check
}

package() {
	cd "$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	mv "bin/$arch-pc-linux-gnu/release/qxmoji" "$pkgdir/usr/bin"
}


