# Maintainer: Yusuf Aktepe <yusuf@yusufaktepe.com>

pkgname=rofi-gpaste-git
_pkgname=${pkgname%-git}
pkgver=r33.e3f5313
pkgrel=1
pkgdesc="Rofi frontend for GPaste clipboard manager"
arch=('any')
url="https://github.com/yusufaktepe/rofi-gpaste"
license=('GPL')
depends=('rofi' 'gpaste' 'xclip' 'xdg-utils' 'xdotool' 'qrencode' 'zenity')
makedepends=('git')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd ${_pkgname}
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd ${_pkgname}
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
