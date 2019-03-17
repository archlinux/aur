# Maintainer: Alex S. shantanna_at_hotmail_dot_com>

pkgname=gnome-shell-extension-cpufreq-git
_pkgname=cpufreq
pkgver=v32.0.r83.g7aa5747
pkgrel=1
pkgdesc="Gnome Shell CPU Frequency Monitor and Governor Manager."
arch=('any')
url="https://github.com/konkor/cpufreq"
license=('GPL3')
conflicts=('gnome-shell-extension-cpufreq')
depends=('gnome-shell')
makedepends=('git')
source=('git+https://github.com/konkor/cpufreq.git')
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  _extid='cpufreq@konkor'
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
  cp -af "${_pkgname}" "${pkgdir}/usr/share/gnome-shell/extensions/"
  mv "${pkgdir}/usr/share/gnome-shell/extensions/${_pkgname}" "${pkgdir}/usr/share/gnome-shell/extensions/${_extid}" 
}
