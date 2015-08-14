# Maintainer: Spike29 <leguen.yannick@gmail.com>

pkgname='qdjango'
pkgver='0.6.1'
pkgrel='1'
pkgdesc='A Qt-based C++ web framework'
arch=('i686' 'x86_64')
license=('LGPL2.1')
url='https://github.com/jlaine/qdjango/'
depends=('qt5-base')
conflicts=('qdjango-git')
source=("https://github.com/jlaine/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('8b63a8e430478c68e4ca2237f75d86fc')

build() {
	cd "$srcdir/$pkgname-$pkgver/"
	[ -d build ] || mkdir build && cd build/
	qmake-qt5 PREFIX=/usr ..
	make 	
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build/"
	make INSTALL_ROOT="$pkgdir/" install
	rm -r $pkgdir/usr/tests/
}
