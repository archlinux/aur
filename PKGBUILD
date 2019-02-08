# Maintainer: Alex S. shantanna_at_hotmail_dot_com>

pkgname=gnome-shell-extension-obmin-git
_pkgname=obmin
pkgver=16.1.r35.g9c9d166
pkgrel=1
pkgdesc="File Sharing Server"
arch=('any')
url="https://github.com/konkor/obmin"
license=('GPL3')
conflicts=('gnome-shell-extension-obmin')
depends=('gnome-shell' 'gjs' 'psmisc')
makedepends=('git')
source=('git+https://github.com/konkor/obmin.git')
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  _extid='obmin@konkor'
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
  cp -af "${_pkgname}" "${pkgdir}/usr/share/gnome-shell/extensions/"
  mv "${pkgdir}/usr/share/gnome-shell/extensions/${_pkgname}" "${pkgdir}/usr/share/gnome-shell/extensions/${_extid}" 
}
