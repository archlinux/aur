# Maintainer: orumin <dev@orum.in>

pkgname=gnome-shell-extension-simple-net-speed-git
_gitname=simplenetspeed
pkgver=r13.d87bd49
pkgrel=1
pkgdesc="Gnome extension to show network speed"
arch=('any')
url="https://github.com/biji/${_gitname}"
license=('GPL3')
depends=('gnome-shell')
makedependes=('git')
provides=("gnome-shell-extension-simple-net-speed")
conflicts=('gnome-shell-extensions-simple-net-speed')
install=${pkgname}.install
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  _uuid='simplenetspeed@biji.extension'
  _install_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -dm655 "${_install_dir}"
  cd "${srcdir}/${_gitname}/"
  cp -af * "${_install_dir}"
}

# vim:set ts=2 sw=2 et:
