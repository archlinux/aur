# Maintainer: Philipp Lenk <philipplenk at codemetas dot de>

pkgname="fernanda"
pkgver="0.22.0_beta47"
pkgrel="1"

pkgdesc="Editor for drafting long-form fiction"
url="https://github.com/fairybow/fernanda"

arch=("x86_64")

depends=(p7zip qt6-base qt6-webengine qt6-webchannel)
makedepends=(cmake git) 

license=("GPL3")

_repo="https://github.com/fairybow/fernanda"
_commit="76b9665300b3f0fd887555f1777a0666248fbf29"
source=("git+${_repo}.git#commit=${_commit}")

sha256sums=('SKIP')

build()
{
	mkdir -p "${srcdir}/${pkgname}/Fernanda/build"
	cd "${srcdir}/${pkgname}/Fernanda/build"
	mv ../../CMakeLists.txt ../
	cmake -DCMAKE_INSTALL_PREFIX=/usr ../
	make
}

package()
{
	cd "${srcdir}/${pkgname}/Fernanda/build"
	make DESTDIR="${pkgdir}/" install
}


