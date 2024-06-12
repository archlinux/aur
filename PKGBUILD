# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Sandor Nagy <sandor[dot]nagy[at]kdemail[dot]net>
# Contributor: Ivan Reche <ivan.reche[at]gmail[dot]com>
# Contributor: Masoud Naservand <relive[dot]mn[at]gmail[dot]com>
pkgname=rcssmonitor
pkgver=19.0.1
pkgrel=1
pkgdesc="The RoboCup Soccer Simulator Monitor"
arch=('x86_64')
url="https://github.com/rcsoccersim/rcssmonitor"
license=('GPL-3.0-or-later')
depends=('fontconfig'
         'gcc-libs'
         'glib2'
         'glibc'
         'libxi'
         'libxrender'
         'libxt'
         'qt5-base'
         'zlib')
optdepends=('rcssserver: RCSS Server' 'soccerwindow2: extra RCSS viewer')
source=("$url/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('4fc62cae6aef7232b91155d994dea426567d4e62b05813a5a1fdd3280325fd94')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
