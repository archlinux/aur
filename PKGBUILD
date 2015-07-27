# Maintainer: Stanislav Seletskiy <s.seletskiy@gmail.com>

pkgname=keynav-improved-grid-git
_gitname=keynav
pkgrel=1
pkgver=20150726
pkgdesc="Patched version of keynav with improved grid"
arch=('i686' 'x86_64')
url="https://github.com/seletskiy/keynav"
license=('BSD')
depends=('xdotool-git')
makedepends=('git' 'perl')
provides=('keynav')
conflicts=('keynav')
source=('git+https://github.com/seletskiy/keynav.git')
md5sums=('SKIP')

build(){
	cd $_gitname
	make keynav
	make keynav.1
}

package(){
	cd $_gitname
	install -D keynav	"$pkgdir/usr/bin/keynav"
	install -D keynavrc	"$pkgdir/etc/keynav/keynavrc"
	install -D keynav.1	"$pkgdir/usr/share/man/man1/keynav.1"
}
