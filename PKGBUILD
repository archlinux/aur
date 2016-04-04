pkgname="gnome-shell-theme-ciliora-secunda-git"
_gitname="ciliora-secunda-shell"
pkgver=r125.4d21682
pkgrel=1
pkgdesc="Ciliora Tertia GNOME Shell theme."
arch=('any')
url="http://zagortenay333.deviantart.com/art/Ciliora-Secunda-Shell-536134191"
license=('GPLv3')
depends=('gnome-shell')
makedepends=('git')
provides=('gnome-shell-theme-ciliora-secunda')
source=('git+https://github.com/zagortenay333/ciliora-secunda-shell.git')
sha256sums=('SKIP')

pkgver() {
	cd "$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_gitname"

	install -d -m 755 ${pkgdir}/usr/share/themes
	cp -r "Ciliora-Secunda" ${pkgdir}/usr/share/themes
  cp "gnome-shell-theme.gresource" "$pkgdir/usr/share/themes/Ciliora-Secunda/"
	install -D -m 644 "README.md" "$pkgdir/usr/share/themes/Ciliora-Secunda/README.md"
	install -D -m 644 "LICENSE" "$pkgdir/usr/share/themes/Ciliora-Secunda/LICENSE"
}
