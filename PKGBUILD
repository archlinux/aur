# Maintainer: Mattheus Roxas <thepogsupreme@tuta.io>
pkgname='amogu.sh'
pkgver=r2.8146f7b
pkgrel=1
pkgdesc="The sussiest script ever."
arch=('x86_64')
url="https://codeberg.org/thepogsupreme/amogu.sh"
license=('EUPL')
depends=('fzf' 'ueberzug')
makedepends=('git')
optdepends=('xclip: Clipboard support' 'dragon-drag-and-drop: Drag and drop support')
# source=('https://codeberg.org/thepogsupreme/amogu.sh')
source=('amogu.sh::git+https://codeberg.org/thepogsupreme/amogu.sh.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm755 ./amogu.sh "$pkgdir/usr/bin/amogu.sh"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}
