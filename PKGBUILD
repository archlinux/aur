# Maintainer: Charles Milette <charles.milette@gmail.com>

_gitname=enlightenment-arc-theme
pkgname=${_gitname}-git
pkgver=r96.e268617
pkgrel=1
pkgdesc="A flat theme for enlightenment"
arch=('any')
url="https://github.com/LeBlue/${_gitname}"
license=('GPL3')
depends=('efl')
makedepends=('git')
source=("git://github.com/LeBlue/${_gitname}.git" "git+https://git.enlightenment.org/core/efl.git")
sha256sums=('SKIP' 'SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}"
	make orig-theme
	make all
}

package() {
	install -Dm644 "${srcdir}/${_gitname}/arc.edj" "$pkgdir"/usr/share/elementary/themes/arc.edj
	install -Dm644 "${srcdir}/${_gitname}/arc-dark.edj" "$pkgdir"/usr/share/elementary/themes/arc-dark.edj
	# install -Dm644 "${srcdir}/${_gitname}/arc-darker.edj" "$pkgdir"/usr/share/elementary/themes/arc-darker.edj
}
