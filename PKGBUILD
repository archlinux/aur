# Maintainer: gilzoide <gilzoide@gmail.com>

pkgname=hell-git
pkgver=r106.bac1099
pkgrel=1
pkgdesc="The Hell build system"
arch=('i686' 'x86_64')
url="https://github.com/gilzoide/hell"
license=("GPL3")
depends=('lua')
makedepends=('git')
source=("$pkgname"::'git://github.com/gilzoide/hell.git')
md5sums=('SKIP')

# Make pkg version as last commit date
pkgver () {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
	cd "$pkgname"
	make
}

package () {
	cd "$pkgname"
	make install prefix="${pkgdir}/usr"
}
