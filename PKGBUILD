# Maintainer: Jesse McClure <jesse [dot] mcclure [at] umassmed [dot] edu>
pkgname=slider-git
_gitname="slider"
pkgver=3.163.017c896
pkgrel=1
pkgdesc="PDF presentation tool"
arch=('x86_64' 'i686')
url="https://github.com/TrilbyWhite/Slider"
license=('GPL3')
depends=('poppler-glib' 'libxinerama')
makedepends=('git')
source=("${_gitname}::git://github.com/TrilbyWhite/Slider.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
	echo 3.$(git rev-list --count HEAD).$(git describe --always )
}

build() {
	cd "${srcdir}/${_gitname}"
	make
}

package() {
	cd "${srcdir}/${_gitname}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
}
