# Maintainer: Yuandi <realyuandi42@gmail.com>
# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Sebastian Reuße <seb@wirrsal.net>

pkgname=zsh-autopair-git
_name="${pkgname%-git}"
pkgver=1.0.r6.g2ec3fd3
pkgrel=1
pkgdesc="Auto-close and delete matching delimiters in Zsh"
arch=('any')
url=https://github.com/hlissner/zsh-autopair
license=('MIT')
depends=('zsh')
makedepends=('git')
provides=("$_name=${pkgver%.r*}")
conflicts=("$_name")
source=("$_name::git+$url")
install="$_name.install"
sha256sums=(SKIP)

pkgver() {
	git -C "$_name" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "$_name"
	install -Dm644 autopair.zsh -t "$pkgdir/usr/share/zsh/plugins/$_name/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
