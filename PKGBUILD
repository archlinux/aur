# Maintainer: ulis <fer.obbee at gmail dot com>

pkgname=otf-fira-code-git
pkgver=0.5.r1.g6bf6f17
pkgrel=1
pkgdesc="Fira Code: monospaced font with programming ligatures."
arch=('any')
url='https://github.com/tonsky/FiraCode.git'
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('git')
source=('git+https://github.com/tonsky/FiraCode.git' "${pkgname}.install")
md5sums=('SKIP' '65d187b075bcb71856f0ac710e33917f')

_gitname=FiraCode

pkgver() {
	cd "$srcdir/$_gitname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$_gitname"

	local font='FiraCode-Regular.otf'
	install -Dm644 "$font" "${pkgdir}/usr/share/fonts/OTF/$font"
}
