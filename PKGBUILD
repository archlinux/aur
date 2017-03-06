# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=gnome-shell-extension-cpupower-git
_gitname=cpupower
pkgver=64.81d06c7
pkgrel=1
pkgdesc="Gnome-Shell Extension for intel-pstate driver"
arch=('any')
url="https://github.com/martin31821/cpupower"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
source=('git+https://github.com/martin31821/cpupower.git')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd $_gitname
  _extid="cpupower@mko-sl.de"
  _extpath="${pkgdir}/usr/share/gnome-shell/extensions/${_extid}"

  install -dm755 "${_extpath}"
  cp -r * "${_extpath}"
}
md5sums=('SKIP')
