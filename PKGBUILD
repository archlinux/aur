# Maintainer: Charles Milette <charles.milette@gmail.com>

_gitname=terminology-themes
pkgname=${_gitname}-git
pkgver=r92.39f406f
pkgrel=1
pkgdesc="Color schemes for the Terminology terminal emulator "
arch=('any')
url="https://github.com/sylveon/${_gitname}"
license=('GPL3')
makedepends=('efl')
source=("git://github.com/sylveon/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}"
	make all
}

package() {
	cd "${srcdir}/${_gitname}"
	make DESTDIR="$pkgdir" install
}
