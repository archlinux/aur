# Maintainer: Shaw <puxx@mail.ustc.edu.cn>
# Contributor: Nick <iglu.sitar at gmail dot com>
# Contributor: Angus Gibson <darthshrine@gmail.com>

pkgname=ipbt
pkgver=20141026.2197432
pkgrel=1
pkgdesc="A high-tech ttyrec player"
arch=('i686' 'x86_64')
url="http://www.chiark.greenend.org.uk/~sgtatham/ipbt/"
license=('MIT')
depends=('ncurses' 'perl')
source=("http://www.chiark.greenend.org.uk/~sgtatham/ipbt/$pkgname-$pkgver.tar.gz")
md5sums=('aee6263c862c102f12cab1ae544d75a9')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	# install executable files
	install -Dm755 ipbt $pkgdir/usr/bin/ipbt
	install -Dm755 ttydump $pkgdir/usr/bin/ttydump
	install -Dm755 ttygrep $pkgdir/usr/bin/ttygrep
	# install man page
	install -Dm644 ipbt.1 $pkgdir/usr/share/man/man1/ipbt.1
	# install LICENCE
	install -Dm644 LICENCE $pkgdir/usr/share/licenses/$pkgname/LICENCE
}

