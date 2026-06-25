# Maintainer: Hezekiah Michael <spiritomb@protonmail.com>
_pkgname=rose-pine-alacritty
pkgname=$_pkgname-git
pkgver=r30.a6f7c82
pkgrel=1
pkgdesc="Dark and light themes for alacritty with all-natural pine, faux fur and a bit of soho vibes for the classy minimalist."
arch=('any')
url="https://rosepinetheme.com"
license=('MIT')
makedepends=('git')
optdepends=('alacritty')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/rose-pine/alacritty.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $_pkgname/dist
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/share/alacritty rose-pine.toml
	install -Dm644 -t "$pkgdir"/usr/share/alacritty rose-pine-dawn.toml
	install -Dm644 -t "$pkgdir"/usr/share/alacritty rose-pine-moon.toml
}
