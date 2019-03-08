# Maintainer: Charles Milette <charles.milette@gmail.com>

_gitname=enlightenment-arc-theme
pkgname=${_gitname}-git
pkgver=r124.076896f
pkgrel=1
pkgdesc="A flat theme for enlightenment"
arch=('any')
url="https://github.com/thewaiter/${_gitname}"
license=('GPL3')
depends=('efl')
makedepends=('git' 'efl')
source=("git://github.com/thewaiter/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}"
	make clean
	make all
}

package() {
	install -Dm644 "${srcdir}/${_gitname}/arc.edj" "$pkgdir"/usr/share/elementary/themes/arc.edj
	install -Dm644 "${srcdir}/${_gitname}/arc-dark.edj" "$pkgdir"/usr/share/elementary/themes/arc-dark.edj
	# install -Dm644 "${srcdir}/${_gitname}/arc-darker.edj" "$pkgdir"/usr/share/elementary/themes/arc-darker.edj
}
