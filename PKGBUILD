# Maintainer: Luca Weiss <WEI16416@spengergasse.at>

pkgname=f3-git
pkgver=6.0.r6.gcbe8d61
pkgrel=1
pkgdesc="Utilities to detect and repair counterfeit flash storage, i.e. thumb drives and memory cards with less flash than advertised"
arch=('i686' 'x86_64')
url="http://oss.digirati.com.br/f3/"
license=('GPL3')
depends=('glibc')
makedepends=('git')
provides=('f3')
conflicts=('f3')
source=('git+https://github.com/AltraMayor/f3.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/f3"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/f3"
	make
}

package() {
	cd "$srcdir/f3"
	make PREFIX="$pkgdir/usr/" install
}
