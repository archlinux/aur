# Maintainer: Alex S. shantanna_at_hotmail_dot_com>

pkgname=gnome-shell-extension-night-light-slider-git
_pkgname=gnome-shell-night-light-slider-extension
pkgver=24.edf5967
pkgrel=2
pkgdesc="Manage GNOME night light temperature intensity from the panel."
arch=('any')
url="https://github.com/TimurKiyivinski/gnome-shell-night-light-slider-extension"
license=('unknow')
depends=('gnome-shell')
makedepends=('git')
source=('git://github.com/TimurKiyivinski/gnome-shell-night-light-slider-extension.git')
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  _extid='night-light-slider.timur@linux.com'
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
  cp -af "${_pkgname}/$_extid" "${pkgdir}/usr/share/gnome-shell/extensions/"
  mv "${pkgdir}/usr/share/gnome-shell/extensions/${_pkgname}" "${pkgdir}/usr/share/gnome-shell/extensions/${_extid}" 
}
