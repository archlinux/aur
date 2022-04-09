# Maintainer: Nil Geisweiller <ngeiswei at the giant g>

pkgname=ctrlr-romankubiak-panels-git
pkgver=r11.1aaeb12
pkgrel=1
epoch=
pkgdesc="Ctrlr panels from Roman Kubiak.  Including demo panels as well as production ready panels for Oberheim Matrix-1000, Yamaha TX81Z, Roland JX8P, Roland Juno106 and more.  Panels are installed under /usr/share/ctrlr/panels."
arch=('any')
url="https://github.com/RomanKubiak/Panels"
license=()
groups=('pro-audio')
depends=('ctrlr')
makedepends=()
checkdepends=()
optdepends=()
provides=('ctrlr-romankubiak-panels')
conflicts=('ctrlr-romankubiak-panels')
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname%-*}::git+https://github.com/RomanKubiak/Panels.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${srcdir}/${pkgname%-*}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	PREFIX="${pkgdir}/usr"
	SHAREPATH="${PREFIX}/share"
	PANELSPATH="${SHAREPATH}/ctrlr/panels"

	# Create local folders and copy panels
	mkdir -p "${PANELSPATH}"
	cp -r "${srcdir}/${pkgname%-*}" "${PANELSPATH}"
}
