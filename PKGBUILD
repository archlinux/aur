# Maintainer: Lorenzo Rizzotti <dev@dreaming.codes>
pkgname=gnome-cosmic-git
pkgver=VERSION
pkgrel=1
epoch=
pkgdesc="COSMIC shell from popos for Gnome."
arch=(x86_64 i686)
url="https://github.com/pop-os/cosmic.git"
license=('GPL')
groups=()
depends=(gnome-meta pop-theme gnome-shell-extension-pop-shell)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=()
validpgpkeys=()

pkgver() {
	cd "{_$pkgname}"
	printf "1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd cosmic
	make
}

package() {
	cd cosmic
	make install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
