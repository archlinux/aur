# Maintainer: Alex S. shantanna_at_hotmail_dot_com>

pkgname=gnome-shell-extension-cpufreq-git
_pkgname=cpufreq
pkgver=a56f8d2
pkgrel=1
pkgdesc="Gnome Shell CPU Frequency Monitor and Governor Manager."
arch=('any')
url="https://github.com/konkor/cpufreq"
license=('BSD')
depends=('gnome-shell')
makedepends=('git')
source=('git://github.com/konkor/cpufreq.git')
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  _extid='cpufreq@konkor'
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
  cp -af "${_pkgname}" "${pkgdir}/usr/share/gnome-shell/extensions/"
  mv "${pkgdir}/usr/share/gnome-shell/extensions/${_pkgname}" "${pkgdir}/usr/share/gnome-shell/extensions/${_extid}" 
}
