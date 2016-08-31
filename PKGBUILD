# Maintainer: ShadowKyogre <shadowkyogre dot public at gmail dot com>

pkgname=slickpicker-git
_githubuser=ShadowKyogre
_gitname="slickpicker"
pkgver=0.2.r0.g104a9ea
pkgrel=1
pkgdesc="A small PyQt color picker widget (can be run on its own)"
arch=('any')
url="https://github.com/${_githubuser}/${_gitname}"
license=('GPL')
makedepends=('git')
conflicts=('slickpicker')
provides=('slickpicker')
depends=('python-pyqt5')
source=("git://github.com/${_githubuser}/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package(){
	cd "$srcdir/$_gitname"
	python setup.py install --root="$pkgdir"
}
