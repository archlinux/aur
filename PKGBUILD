# Maintainer: Philipp Lenk <philipplenk at codemetas dot de>

pkgname="fernanda"
pkgver="0.5.1_beta7"
pkgrel="1"

pkgdesc="Editor for drafting long-form fiction"
url="https://github.com/fairybow/fernanda"

arch=("x86_64")

depends=(p7zip qt6-base)
makedepends=(cmake git) 

license=("GPL3")

_repo="https://github.com/fairybow/fernanda"
_commit="a5acbf4254d4bbd43dcbfe043dc2352d46eb4122"
source=("git+${_repo}.git#commit=${_commit}")

sha256sums=('SKIP')

build()
{
	mkdir -p "${srcdir}/${pkgname}/fernanda/build"
	cd "${srcdir}/${pkgname}/fernanda/build"
	mv ../../CMakeLists.txt ../
	cmake -DCMAKE_INSTALL_PREFIX=/usr ../
	make
}

package()
{
	cd "${srcdir}/${pkgname}/fernanda/build"
	make DESTDIR="${pkgdir}/" install
}


