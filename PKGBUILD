# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-konsole-theme-git
pkgdesc="Soothing pastel theme for Konsole"
pkgver=r30.3b64040
pkgrel=1
url="https://github.com/catppuccin/konsole"
license=('MIT')
arch=('any')
makedepends=('git')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm0644 -t "$pkgdir"/usr/share/konsole/ $(find . -type f -name 'catppuccin-*.colorscheme')
	install -Dm0644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
