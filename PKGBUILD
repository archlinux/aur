#Contributor: Leon Belmont <meow AT linux DOT cn>

pkgname=tweak-hexeditor
_pkgname=tweak
pkgdesc="Efficient Command Line hex editor"
pkgver=3.01
pkgrel=1
arch=('i686' 'x86_64')
depends=('ncurses' 'glibc')
makedepends=('make' 'gcc')
url=http://www.chiark.greenend.org.uk/~sgtatham/tweak
license=('custom')
source=("http://mirrors.163.com/debian/pool/main/t/tweak/${_pkgname}_${pkgver}.orig.tar.gz")
md5sums=('3ae8db9fd482b679835a80c4635f71be')


build() {
	cd "$srcdir/$_pkgname-$pkgver"
	sed -ri 's@^(PREFIX=).*$@\1"'${pkgdir}'/usr"@' Makefile
	make
}
package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make install
}
