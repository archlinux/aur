# Maintainer: Rowan Decker <rowan@rowandecker.com>
pkgname=tarmak-cli-git
pkgver=r26.dae41b0
pkgrel=1
pkgdesc="Create the intermediary key layouts on CLI for learning Colemak"
arch=('any')
url="https://github.com/quiniouben/vba://github.com/azmr/tarmak-cli"
depends=('bash')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git://github.com/azmr/tarmak-cli.git')
install=tarmak-cli-git.install
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#build() {
#}

package() {
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/tarmak-cli"
	cp -r $srcdir/${pkgname%-git}/* "$pkgdir/usr/share/tarmak-cli"
	ln -s /usr/share/tarmak-cli/tmk.sh "$pkgdir/usr/bin/tmk.sh"
}
