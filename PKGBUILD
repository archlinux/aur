# Maintainer: SuicideCatt <fr7g31@gmail.com>

pkgname=sct_argsp
pkgver=0.1.0
pkgrel=1
pkgdesc="C++ Arguments parser"
url="https://github.com/SuicideCatt/ArgsP"

arch=(any)
depends=(gcc)
makedepends=(git cmake make)

source=("git+https://github.com/SuicideCatt/ArgsP.git")
sha256sums=('SKIP')

prepare()
{
	cd ArgsP
	mkdir -p build
}

build()
{
	cd ArgsP/build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -G "Unix Makefiles"
}

package()
{
	cd ArgsP/build
	make DESTDIR="${pkgdir}" install
}
