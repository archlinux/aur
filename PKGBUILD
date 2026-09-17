# Maintainer: Shusui Moyatani <syusui.s at gmail dot com>

pkgname=apdtool
pkgver=1.1.2
pkgrel=1
pkgdesc="CUI Tool for APD/ADW file"
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/soft/apdtool.html"
license=('MIT')
depends=('libpng' 'zlib')
makedepends=('ninja')
source=("https://gitlab.com/azelpg/apdtool/-/archive/v${pkgver}/apdtool-v${pkgver}.tar.gz")
sha256sums=('a4a3d305d6b18e120e94e4149d80c03afb48d57b1c74621e1e5de8c3d48328fb')

build() {
	cd "${srcdir}/${pkgname}-v${pkgver}"
	./configure --prefix=/usr
	cd build/
	ninja
}

package() {
	cd "${srcdir}/${pkgname}-v${pkgver}/build/"
	DESTDIR="${pkgdir}" ninja install
}
