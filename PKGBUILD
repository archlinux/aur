# Maintainer: Bruno Nova <brunomb.nova@gmail.com>
pkgname=drmips-doc
_pkgname=drmips
pkgver=2.0.0
pkgrel=1
pkgdesc="Graphical MIPS simulator to support computer architecture teaching and learning - User Manuals"
arch=('any')
url="http://brunonova.github.io/$pkgname/"
license=('GPL3')
makedepends=('cmake>=2.8' 'texlive-core' 'texlive-latexextra' 'texlive-science')
optdepends=('drmips: the simulator')
source=("https://github.com/brunonova/$pkgname/releases/download/v$pkgver/DrMIPS_v$pkgver.tar.xz")
md5sums=('f4756bf519e96d7811a1276633346f79')

build() {
	cd "$srcdir"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DDRMIPS_BUILD_PC_VERSION=off -DDRMIPS_BUILD_TESTS=off
	make
}

package() {
	cd "$srcdir"
	make DESTDIR="$pkgdir" install
}
