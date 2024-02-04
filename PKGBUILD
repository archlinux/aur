# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributer : Sandor Nagy <sandor.nagy[at]kdemail[dot]net>
pkgname=rcssserver
pkgver=18.1.3
pkgrel=1
pkgdesc="The RoboCup Soccer Simulator Server is a research and educational tool for multi-agent systems and artificial intelligence. It allows 11 simulated autonomous robotic players to play soccer."
arch=('x86_64')
url="https://github.com/rcsoccersim/rcssserver"
license=('LGPL-3.0-or-later')
depends=('boost-libs>=1.44')
makedepends=('boost>=1.44' 'cmake')
optdepends=('rcssmonitor: RCSS Monitor'
            'librcsc: basic library to develop the RCSS client and tools')
source=("$url/archive/refs/tags/$pkgname-$pkgver.tar.gz")
sha256sums=('60e659e961279edafa4a8a6c478da74128a660a485b950ff7930bd2f3d19acf0')

build() {
	cmake -B build -S "$pkgname-$pkgname-$pkgver" \
	-DCMAKE_BUILD_TYPE='None' \
	-DCMAKE_INSTALL_PREFIX='/usr' \
	-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
