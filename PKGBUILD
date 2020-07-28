# Maintainer: nullgemm <nullgemm@mailbox.org>
pkgname=libexcalibar-git
pkgver=0.0.1
pkgrel=1
pkgdesc="excalibar core (plugins interface)"
arch=('i686' 'x86_64')
url="https://github.com/nullgemm/excalibar"
license=('custom:WTFPL')
makedepends=('git')
depends=('libxcb' 'cairo' 'pango')
source=("git+https://github.com/nullgemm/excalibar.git")
md5sums=('SKIP')

build() {
	cd excalibar/lib
	make
}

package() {
	cd excalibar/lib
	make DESTDIR="$pkgdir" install
	install -D -m644 ../license.md "${pkgdir}/usr/share/licenses/${pkgname}/WTFPL"
}
