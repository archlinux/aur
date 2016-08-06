# Maintainer: orumin <dev@orum.in>

pkgname=gnome-shell-extension-refresh-wifi-git
_gitname=gse-refresh-wifi
pkgver=3.18.0.r5.g4ae5dad
pkgrel=1
pkgdesc="This extension adds a refresh button to the Wifi connection selection dialog to request for a network scan manually."
arch=('any')
url="https://github.com/kgshank/${_gitname}"
license=('GPL3')
depends=('gnome-shell')
makedependes=('git')
provides=("gnome-shell-extension-refresh-wifi")
conflicts=('gnome-shell-extensions-git')
install=${pkgname}.install
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  _uuid='refresh-wifi@kgshank.net'
  _install_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -dm655 "${_install_dir}"
  cd "${srcdir}/${_gitname}/${_uuid}"
  cp -af * "${_install_dir}"
}

# vim:set ts=2 sw=2 et:
