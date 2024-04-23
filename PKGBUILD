# Maintainer: Guillaume Boehm <aur@mail.gboehm.com>
pkgname="simple-sddm-theme-git"
_gitname="simple-sddm"
pkgver=r13.6888ccc
pkgrel=1
epoch=
pkgdesc="A Simple theme variant for the SDDM Login Manager"
arch=('any')
url="https://github.com/JaKooLit/${_gitname}"
license=(LGPL2 GPL3)
groups=()
depends=('qt5-graphicaleffects' 'qt5-quickcontrols2' 'qt5-svg' 'sddm')
makedepends=(git)
optdepends=()
provides=()
conflicts=()
backup=("usr/share/sddm/themes/${_gitname}/theme.conf")
source=("git+https://github.com/JaKooLit/${_gitname}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share/sddm/themes/"
	cp -r "${_gitname}/" "${pkgdir}/usr/share/sddm/themes/"
}
