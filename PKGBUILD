# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Sandor Nagy <sandor[dot]nagy[at]kdemail[dot]net>
pkgname=soccerwindow2
pkgver=rc2023
pkgrel=1
pkgdesc="A visualization tool for the RoboCup Soccer Simulation"
arch=('x86_64')
url="https://github.com/helios-base/soccerwindow2"
license=('GPL-3.0-or-later')
depends=('bash' 'gcc-libs' 'glibc' 'librcsc' 'qt5-base')
makedepends=('boost')
optdepends=('rcssserver: RCSS Server'
            'rcssmonitor: RCSS Monitor')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('244d3044db82ff163812b76f5b8c8a2a90a9ac6a61aa28d0855d224f64460812')

build() {
	cd "$pkgname-$pkgver"
	./bootstrap
	./configure --prefix=/usr --with-librcsc=/usr/lib
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
