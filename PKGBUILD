# Maintainer: Alex S. shantanna_at_hotmail_dot_com>

pkgname=gnome-shell-extension-timepp-git
_pkgname=timepp__gnome
pkgver=v3.34_57_g767aa8c
pkgrel=1
pkgdesc="A todo.txt manager, time tracker, timer, stopwatch, pomodoro, and alarm clock"
arch=('any')
url="https://github.com/zagortenay333/timepp__gnome"
license=('GPL3')
conflicts=('gnome-shell-extension-timepp')
depends=('gnome-shell')
makedepends=('git')
source=('git+https://github.com/zagortenay333/timepp__gnome.git')
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --always --tags | tr '-' '_'
}

package() {
  _extid='timepp@zagortenay333'
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
  cp -af "${_pkgname}" "${pkgdir}/usr/share/gnome-shell/extensions/"
  mv "${pkgdir}/usr/share/gnome-shell/extensions/${_pkgname}" "${pkgdir}/usr/share/gnome-shell/extensions/${_extid}" 
}
