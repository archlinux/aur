# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=gnome-shell-extension-hide-legacy-tray-git
_gitname=shell-hide-legacy-tray
pkgver=r4.42e57a2
pkgrel=1
pkgdesc="Gnome Shell extension to hide the legacy tray bar"
arch=('any')
url="https://github.com/jonnylamb/shell-hide-legacy-tray"
license=('LGPL')
depends=('gnome-shell')
makedepends=('git')
provides=('gnome-shell-extension-hide-legacy-tray')
conflicts=('gnome-shell-extension-hide-legacy-tray')
install=${pkgname}.install
source=('git://github.com/jonnylamb/shell-hide-legacy-tray.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  _uuid='hide-legacy-tray@shell-extensions.jonnylamb.com'

  install -d "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  cd "${srcdir}/${_gitname}"
  cp -af * "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
}

# vim:set ts=2 sw=2 et:
