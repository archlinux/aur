# Maintainer: SuicideCatt <random.cat.from.internet@gmail.com>

pkgname=sct_argsp
pkgver=0.4.0
pkgrel=1
pkgdesc="Simple arguments parser for C++20."
url="https://github.com/SuicideCatt/ArgsP"
license=(MIT)
arch=(any)
depends=(gcc)
makedepends=(git cmake make)

source=("${pkgname}-${pkgver}.tag.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare()
{
	cd "ArgsP-${pkgver}"
	mkdir -p build
}

build()
{
	cd "ArgsP-${pkgver}/build"
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -G "Unix Makefiles"
}

package()
{
	cd "ArgsP-${pkgver}/build"
	make DESTDIR="${pkgdir}" install
}
