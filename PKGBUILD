# Maintainer: Aroun <login att b-vo dott fr>

pkgname=rhythmbox-plugin-open-containing-folder
_pkgname=rhythmbox-plugins-open-containing-folder
_name=OpenContainingFolder
pkgver=41
pkgrel=1
pkgdesc='Adds an option to open the folder containing the selected track(s) to the right click context menu of rhythmbox music player'
arch=('any')
url="https://github.com/donaghhorgan/rhythmbox-plugins-open-containing-folder"
license=(GPL3)
depends=(
	rhythmbox
	xdg-utils
)
makedepends=(
	git
)
provides=(
	rhythmbox-plugin-open-containing-folder
)
conflicts=(
	rhythmbox-plugin-open-containing-folder
)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "%s" "$(git rev-list --count HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}"
	files=( LICENSE $_name.plugin $_name.py README.md )
	for file in "${files[@]}"
	do
		install -Dm644 $file "${pkgdir}/usr/lib/rhythmbox/plugins/${_name}/$file"
	done
}

