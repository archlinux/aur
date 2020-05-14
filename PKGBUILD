# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Emiel Kollof <emiel@kollof.nl>
pkgname=dwmblocks-ekollof-git
pkgver=0.1r8.a3c77c2
pkgrel=1
epoch=
pkgdesc="Emiel Kollof's personal patched build of dwmblocks."
arch=(x86_64)
url="https://git.hackerheaven.org/ekollof/dwmblocks-ekollof.git"
license=('MIT')
groups=()
depends=(libx11)
makedepends=(git)
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
    cd "dwmblocks-ekollof"
    printf "0.1r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "dwmblocks-ekollof"
	make > /dev/null
}

package() {
	cd "dwmblocks-ekollof"
	make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
