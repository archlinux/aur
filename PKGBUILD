# Maintainer: balaraz <balaraz@tuta.io>

_name=tclap
_ver=1.4.0-rc1
pkgname="$_name-rc"
pkgver=1.4.0_rc1
pkgrel=1
pkgdesc='Header only, C++ 98 library to parse input program options'
license=(MIT)
url="http://tclap.sourceforge.net/"
arch=(any)
makedepends=(cmake)
conflicts=(tclap)
source=("https://deac-riga.dl.sourceforge.net/project/${_name}/$_name-$_ver.tar.bz2")
sha256sums=("33e18c7828f76a9e5f2a00afe575156520e383693059ca9bc34ff562927e20c6")

package() {
		cd ./${_name}-${_ver}
		cmake -Bbuild -DCMAKE_BUILD_TYPE=Release -Wno-dev
		cmake --build ./build
		DESTDIR="$pkgdir" cmake --install ./build --prefix=/usr
}
