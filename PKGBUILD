# Maintainer: SuicideCatt <random.cat.from.internet@gmail.com>

pkgname=sct_logcolors
pkgver=0.3.1
pkgrel=1
pkgdesc="Colored and formated text generator for std::ostream"
url="https://github.com/SuicideCatt/LogColors"
license=(MIT)
arch=(any)
depends=(gcc)
makedepends=(git cmake make)
source=("${pkgname}-${pkgver}.tag.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare()
{
	cd "LogColors-${pkgver}"
	mkdir -p build
}

build()
{
	cd "LogColors-${pkgver}/build"
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -G "Unix Makefiles"
}

package()
{
	cd "LogColors-${pkgver}/build"
	make DESTDIR="${pkgdir}" install
}
