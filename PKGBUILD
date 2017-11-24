# $Id$
# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >

pkgname=gnome-shell-extension-more-columns-in-applications-view-git
pkgver=r45.27a2ef4
pkgrel=1
pkgdesc='Extension for GNOME shell to set the number of columns in the "applications" view.'
arch=(any)
url="https://github.com/Maestroschan/More-columns-in-applications-view"
license=(GPL3)
depends=('gnome-shell>=3.18')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=gnome-shell-extension.install
source=(""${pkgname%-git}"::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -d "${pkgdir}/usr/share/gnome-shell/extensions/set-columns@maestroschan.fr"
	cp -a "${pkgname%-git}"/* \
	  "${pkgdir}/usr/share/gnome-shell/extensions/set-columns@maestroschan.fr/"
}
# vim:set ts=2 sw=2 et:
