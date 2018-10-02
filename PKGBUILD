# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname='gnome-shell-extension-netctl-auto-gnome-git'
pkgver=r27.80a54b6
pkgrel=1
pkgdesc='Allows you to switch between netctl profiles using a menu in the GNOME notification area.'
arch=(any)
url="https://github.com/nigeil/netctl-auto-gnome"
license=('unknown')
depends=('gnome-shell' 'netctl' 'wpa_actiond')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/nigeil/netctl-auto-gnome.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	local ext_name='netctl-auto-gnome@nigelmichki.ninja'
	install -Dm644 -t "$pkgdir/usr/share/gnome-shell/extensions/$ext_name" "$ext_name/"*
}
