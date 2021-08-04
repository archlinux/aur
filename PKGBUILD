# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Leo Spratt <contact@enchantedcode.co.uk>
pkgname=shell-utilities-git
pkgver=1.0.r17.420e6a5
pkgrel=1
epoch=
pkgdesc="A collection of scripts to run in a Linux/Unix terminal."
arch=(x86_64)
url="https://github.com/enchant97/shell-utilities.git"
license=('GPL')
groups=()
depends=(
	git
	findutils
	less
	python
	python-requests)
makedepends=()
checkdepends=()
optdepends=()
provides=(
	ignore-gen
	license-gen
	project-gen
	git-archiver
	git-maintenance)
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

package() {
	cd shell-utilities
	mkdir -p "${pkgdir}/usr/bin/shell-utilities"
	make DESTDIR="${pkgdir}/usr/bin/shell-utilities" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
