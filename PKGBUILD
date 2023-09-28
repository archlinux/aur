# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=dracula-alacritty
pkgname=$_pkgname-git
pkgver=r15.9ae0fde
pkgrel=1
pkgdesc="Dark theme for Alacritty"
arch=('any')
url="https://draculatheme.com/alacritty"
license=('MIT')
groups=('dracula-theme')
makedepends=('git')
optdepends=('alacritty')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/dracula/alacritty.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/share/alacritty dracula.toml
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
