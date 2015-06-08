# Maintainer: Bruno Nova <brunomb.nova@gmail.com>
pkgname=drmips-doc
_pkgname=drmips
pkgver=1.3.0
pkgrel=1
pkgdesc="Graphical MIPS simulator to support computer architecture teaching and learning - User Manuals"
arch=('any')
url="https://bitbucket.org/brunonova/drmips"
license=('GPL3')
makedepends=('cmake>=2.8' 'texlive-core' 'texlive-latexextra' 'texlive-science')
optdepends=('drmips: the simulator')
source=("https://bitbucket.org/brunonova/$_pkgname/downloads/DrMIPS_v$pkgver.tar.xz")
md5sums=('78378319a6dcb29c51435e8c0b051fac')

build() {
	cd "$srcdir"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DDRMIPS_BUILD_PC_VERSION=off
	make
}

package() {
	cd "$srcdir"
	make DESTDIR="$pkgdir" install
}
