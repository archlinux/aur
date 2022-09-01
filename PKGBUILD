# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: beest <gnubeest@gmail.com>
pkgname=duc
pkgver=1.4.5
pkgrel=1
pkgdesc="A library and suite of tools for inspecting disk usage."
arch=('i686' 'x86_64')
url="http://duc.zevv.nl/"
license=('GPL2')
depends=('cairo' 'pango' 'leveldb' 'ncurses')
source=("https://github.com/zevv/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
validpgpkeys=(F042F5CDB0A6EC6ACB80A829CACDA4B54202FA2F)

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --with-db-backend=leveldb
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

sha512sums=('b6d48222ed2821d3d1317102f867f71f9060a093ba11ba48d9f0d9dc743c5b361442cb605aec6e91dd6588ae4b51897b4ed5da96ba33019e8a501a262af12371')
