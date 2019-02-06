# Maintainer: Josh Hoffer < hoffer dot joshua at gmail dot com >
pkgname=dune-typetree
pkgver=2.6.0
pkgrel=1
pkgdesc='A template library for statically typed object trees'
groups=('dune')
url='http://www.dune-project.org/pdelab'
arch=('any')
license=('custom')
source=("git+https://gitlab.dune-project.org/staging/${pkgname}.git#tag=v${pkgver}")
makedepends=('cmake' "dune-common>=2.6.0")
makedepends=('cmake')
md5sums=('SKIP')

package() {
	dunecontrol --only=${pkgname} make install DESTDIR="${pkgdir}"
	install -m644 -D ${pkgname}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	find "${pkgdir}" -type d -empty -delete
}

build() {
	CMAKE_FLAGS='-DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib -fPIC -DBUILD_SHARED_LIBS:BOOL=OFF' \
		                dunecontrol configure --enabled-shared
	    dunecontrol  make
    }
