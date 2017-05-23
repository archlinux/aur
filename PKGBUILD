# Maintainer: Hakim Zulkufli (acrox999)
# Contributor: Maarten de Boer (ventieldopje)

pkgname="gnome-shell-theme-ciliora-tertia-git"
_gitname="ciliora-tertia-shell"
pkgver=r26.f3d1a84
pkgrel=1
pkgdesc="Ciliora Tertia GNOME Shell theme."
arch=('any')
url="http://zagortenay333.deviantart.com/art/Ciliora-Tertia-Shell-536134191"
license=('GPLv3')
depends=('gnome-shell')
makedepends=('git')
provides=('gnome-shell-theme-ciliora-tertia')
source=('git+https://github.com/zagortenay333/ciliora-tertia-shell.git')
sha256sums=('SKIP')

pkgver() {
	cd "$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_gitname"

	install -d -m 755 ${pkgdir}/usr/share/themes
	cp -r "Ciliora-Tertia" ${pkgdir}/usr/share/themes
	install -D -m 644 "README.md" "$pkgdir/usr/share/themes/Ciliora-Tertia/README.md"
	install -D -m 644 "LICENSE" "$pkgdir/usr/share/themes/Ciliora-Tertia/LICENSE.md"
}
