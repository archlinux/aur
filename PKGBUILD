# Maintainer: Alex S. shantanna_at_hotmail_dot_com>

pkgname=gnome-shell-extension-cpufreq-git
_pkgname=cpufreq
pkgver=87.75fa137
pkgrel=1
pkgdesc="The simple program to switch the monitor with one klick betwin single and dual mode"
arch=('any')
url="https://github.com/konkor/cpufreq"
license=('BSD')
depends=('gnome-shell')
makedepends=('git')
source=('git://github.com/konkor/cpufreq.git')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  _extid='cpufreq@konkor'
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
  cp -af "${_gitname}" "${pkgdir}/usr/share/gnome-shell/extensions/"
  mv "${pkgdir}/usr/share/gnome-shell/extensions/${_gitname}" "${pkgdir}/usr/share/gnome-shell/extensions/${_extid}" 
}
