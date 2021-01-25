# Maintainer: Björn Feber <bfeber@protonmail.com>
pkgname=ross-wm-configs-git
pkgver=r38.8e5e925
pkgrel=1
pkgdesc="Window wanager configuration files for the ROSS Shell"
arch=('x86_64')
url="https://github.com/rosssoftware/Shell/tree/master/wm-configs"
license=('GPL3')
depends=('awesome' 'terminus-font')
optdepends=()
makedepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/rosssoftware/Shell.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${pkgname%-git}/wm-configs"
	mkdir -p "$pkgdir"/etc/xdg/awesome "$pkgdir"/usr/share/xsessions
	ls
	cp -r awesome "$pkgdir"/etc/xdg/awesome/ross
	cp ross-shell.desktop "$pkgdir"/usr/share/xsessions
}
