# Maintainer: Lorenzo Rizzotti <dev@dreaming.codes>
pkgname=gnome-cosmic-desktop-widget-git
pkgver=VERSION
pkgrel=1
epoch=
pkgdesc="COSMIC desktop widget from popos for Gnome."
arch=(x86_64 i686)
url="https://github.com/pop-os/desktop-widget"
license=('GPL')
groups=()
depends=(gnome pop-theme gnome-shell-extension-pop-shell gnome-cosmic-git)
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
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd desktop-widget
	make
}

package() {
	cd desktop-widget
	make install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
