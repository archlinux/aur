# Maintainer: mynacol <paul àt dismail _ de>

pkgname=theme-switcher-git
pkgver=r.
pkgrel=1
pkgdesc="Switching between light and dark themes made easy"
arch=('any')
url="https://aur.archlinux.org/packages/${pkgname}/"
license=('GPL')
depends=('bash' 'glib2' 'sed' 'jq' 'moreutils')
optdepends=(
	'xfce4-settings: for GTK switching under Xorg'
	'qt5ct: for Qt5 switching. Additional setup required.'
	'adwaita-qt: Qt5 theme'
	'feh: for setting wallpaper under Xorg'
	'sway: for setting wallpaper in sway'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://aur.archlinux.org/${pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 dark-mode.sh "$pkgdir/usr/bin/${pkgname%-git}"
}
