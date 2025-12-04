# Maintainer:
# Contributor: Rowan Decker <rowan@rowandecker.com>

pkgname=tarmak-cli-git
pkgver=r29.b7cd2fe
pkgrel=1
pkgdesc="Create the intermediary key layouts on CLI for learning Colemak"
arch=('any')
url="https://github.com/azmr/tarmak-cli"
license=('GPL-2.0-or-later')
depends=('bash')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
install=tarmak-cli-git.install
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${pkgname%-git}"
	install -Dm755 tmk.sh -t "$pkgdir/usr/bin/"
	install -Dm644 *.txt *.md -t "$pkgdir/usr/share/tarmak-cli"
}
