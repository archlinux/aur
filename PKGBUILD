# Maintainer: Hezekiah Michael <spiritomb@protonmail.com>
_pkgname=embark-alacritty
pkgname=$_pkgname-git
pkgver=r7.9a99e7a
pkgrel=2
pkgdesc="A dark, ambitious theme for alacritty. A port of the Embark color scheme."
arch=('any')
url="https://embark-theme.github.io"
license=('MIT')
makedepends=('git')
optdepends=('alacritty')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/embark-theme/alacritty.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/share/alacritty embark.yml
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
