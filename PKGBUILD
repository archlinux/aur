# Maintainer: cylgom <cylgom@gmail.com>
pkgname=libexcalibar-git
pkgver=0.0.1
pkgrel=1
pkgdesc="excalibar core (plugins interface)"
arch=('i686' 'x86_64')
url="https://github.com/cylgom/excalibar"
license=('custom:WTFPL')
makedepends=('git')
depends=('libxcb' 'cairo' 'pango')
source=('git+https://github.com/cylgom/excalibar.git')
md5sums=('SKIP')

build() {
	cd excalibar/lib
	make
}

package() {
	cd excalibar/lib
	make DESTDIR="$pkgdir" install
	install -D -m644 ../LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/WTFPL"
}
