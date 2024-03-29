# Maintainer: Guillaume Boehm <aur@mail.gboehm.com>
pkgname="sddm-theme-tokyo-night-git"
_gitname="tokyo-night-sddm"
pkgver=r6.320c8e7
pkgrel=2
epoch=
pkgdesc="A Tokyo Night theme for the SDDM Login Manager"
arch=('any')
url="https://github.com/rototrash/${_gitname}"
license=(LGPL2 GPL3)
groups=()
depends=('qt5-graphicaleffects' 'qt5-quickcontrols2' 'qt5-svg' 'sddm')
makedepends=(git)
optdepends=()
provides=()
conflicts=()
backup=("usr/share/sddm/themes/${_gitname}/theme.conf")
source=("git+https://github.com/rototrash/${_gitname}")
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
