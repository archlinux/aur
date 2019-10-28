# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Contributor: Protesilaos Stavrou <info at protesilaos dot com>
pkgname=tempus-themes-vim-git
pkgver=r36.60c8b5e
pkgrel=1
pkgdesc="Tempus Themes for Vim"
arch=('any')
url="https://protesilaos.com/tempus-themes"
license=('GPL3')
depends=('vim')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.com/protesilaos/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -d "$pkgdir/usr/share/vim/vimfiles/colors"
	install -Dm644 colors/*.vim "$pkgdir/usr/share/vim/vimfiles/colors"
}
