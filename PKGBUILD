# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Murli Tawari <kraanzu@gmail.com>
pkgname=termtyper-git
pkgver=0.1.r.
pkgrel=1
epoch=
pkgdesc="A TUI application written in python for typing!"
arch=(x86_64)
url="https://github.com/kraanzu/termtyper.git"
license=('MIT')
groups=()
depends=(git)
makedepends=(python)
checkdepends=()
optdepends=()
provides=(termtyper)
conflicts=(termtyper)
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
    printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd termtyper
    pip install .
}

package() {
    cd termtyper
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/termtyper/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/termtyper/README.md"
}
