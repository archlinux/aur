# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=dracula-dircolors
pkgname=$_pkgname-git
pkgver=r11.057d179
pkgrel=1
pkgdesc="Dark theme for dircolors"
arch=('any')
url="https://draculatheme.com/dircolors"
license=('MIT')
groups=('dracula-theme')
makedepends=('git')
optdepends=('coreutils')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/dracula/dircolors.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	install -Dm644 .dircolors "$pkgdir"/etc/DIR_COLORS.dracula
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
