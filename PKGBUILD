# Maintainer: Yusuf Aktepe <yusuf@yusufaktepe.com>

pkgname=rofi-brbw-git
_pkgname=${pkgname%-git}
pkgver=r6.29a2953
pkgrel=1
pkgdesc="Rofi frontend for Bitwarden (rbw)"
arch=('any')
url="https://github.com/yusufaktepe/rofi-brbw"
license=('GPL')
depends=('rofi' 'rbw' 'gawk' 'xclip' 'xdg-utils' 'xdotool')
optdepends=(
	'qrencode: QR code support'
	'ttf-font-nerd: for icons'
	'ttf-font-awesome: for icons'
)
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
