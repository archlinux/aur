# Maintainer: Yusuf Aktepe <yusuf@yusufaktepe.com>

pkgname=rofi-brbw-git
_pkgname=${pkgname%-git}
pkgver=r5.06a735a
pkgrel=1
pkgdesc="Rofi frontend for Bitwarden (rbw)"
arch=('any')
url="https://github.com/yusufaktepe/rofi-brbw"
license=('GPL')
depends=('rofi' 'rbw' 'gawk' 'xclip' 'xdg-utils' 'xdotool' 'qrencode' 'ttf-font-nerd')
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
