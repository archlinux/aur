# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=qpakman
pkgver=0.67
pkgrel=1
pkgdesc='A command-line tool for managing PAK and WAD files from QuakeI/II & Hexen II'
arch=('i686' 'x86_64')
url='https://github.com/bunder/qpakman'
license=('GPL')
depends=('libpng')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::https://github.com/bunder/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('7ca54ad88b80b5f00d0eb0bd61ca27c0')

build() {
	cd $pkgname-$pkgver
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd $pkgname-$pkgver
	make install DESTDIR="$pkgdir"
}
