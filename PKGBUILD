# Maintainer : JSkier <jskier at gmail dot com>

pkgname=hyperscan-git
pkgver=03102017
pkgrel=1
pkgdesc='A high-performance multiple regex matching library, commonly used with suricata or snort'
arch=('any')
url="https://01.org/hyperscan/"
license=('BSD')
provides=('hyperscan')
depends=('boost')
makedepends=('boost-libs' 'ragel' 'cmake')
source=("git+https://github.com/01org/hyperscan")
sha512sums=('SKIP')

build() {
    cd "${srcdir}/hyperscan"
    mkdir -p build
    cd build
    cmake .. \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_STATIC_AND_SHARED=1
    make
}

package()
{
	cd "$srcdir/hyperscan/build"
	make install DESTDIR="$pkgdir"
}
