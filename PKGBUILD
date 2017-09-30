# Contributor: Yen Chi Hsuan <yan12125@gmail.com>
# Maintainer: Brian Clemens <brian@teknik.io>
pkgname=purple-line-git
pkgver=0.1
pkgrel=2
epoch=0
pkgdesc="libpurple plugin for LINE."
arch=('i686' 'x86_64')
url="http://altrepo.eu/git/purple-line"
license=('MIT')
depends=('thrift' 'libpurple' 'libgcrypt')
makedepends=('boost' 'git')
provides=('purple-line')
conflicts=('purple-line')
source=('git+http://altrepo.eu/git/purple-line.git')
md5sums=('SKIP')

#prepare() {
#	cd purple-line
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

build() {
	cd purple-line
	make clean
	make
}

package() {
	cd purple-line
	make DESTDIR="$pkgdir/" install
	install -D LICENSE $pkgdir/usr/share/licenses/purple-line/LICENSE
}

