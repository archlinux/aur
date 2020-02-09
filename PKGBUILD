# Maintainer: crian <crian84 at gmail dot com>

pkgname=fontpreview-git
pkgver=r19.a938103
pkgrel=1
pkgdesc="Very customizable and minimal font previewer written in bash"
arch=('any')
url="https://github.com/sdushantha/fontpreview"
license=('MIT')
depends=('xdotool' 'fzf' 'imagemagick' 'sxiv')
makedepends=('git')
provides=('fontpreview')
conflicts=('fontpreview')
source=("git://github.com/sdushantha/fontpreview.git")
sha256sums=('SKIP')

pkgver() {
	cd fontpreview
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd fontpreview
	install -m755 -D fontpreview "$pkgdir/usr/bin/fontpreview"
	install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
