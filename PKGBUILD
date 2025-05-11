# Maintainer: Rowan Decker <rowan@rowandecker.com>
pkgname=bigbagkbdtrixxkb-git
pkgver=r66.7340bd9
pkgrel=1
pkgdesc="DreymaR's Big Bag of Keyboard Tricks For Linux. Colemak mappings and modifications."
arch=('any')
url="https://github.com/DreymaR/BigBagKbdTrixXKB"
depends=('bash')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/DreymaR/BigBagKbdTrixXKB.git')
install=BigBagKbdTrixXKB-git.install
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/BigBagKbdTrixXKB"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/BigBagKbdTrixXKB"
	cd "$srcdir/BigBagKbdTrixXKB"
	chmod +x *.sh
	cp -r * "$pkgdir/usr/share/BigBagKbdTrixXKB"
	ln -s /usr/share/BigBagKbdTrixXKB/setxkb.sh "$pkgdir/usr/bin/dreymar-setxkb"
}
