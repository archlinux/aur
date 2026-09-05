#Maintainer: stefonarch standreas@riseup.net

_pkgname=lxqt-panel-profiles
pkgname=$_pkgname
pkgver=v1.4.1.r0.g2fd18cc
pkgrel=1
pkgdesc="Backup, restore and switch configurations of lxqt-panel"
arch=('any')
url="https://codeberg.org/MrReplikant/lxqt-panel-profiles.git"
license=(' GPL 2.0')
depends=('lxqt-panel' 'tar' 'python-pyqt6' 'qt6-tools')
makedepends=('git')
provides=("${pkgname}=${pkgver}")
source=("git+https://codeberg.org/MrReplikant/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${srcdir}/${_pkgname}
  install -dm 755 "${pkgdir}"/usr/share/${_pkgname}
  install -dm 755 "${pkgdir}"/usr/bin
  install -dm 755 "${pkgdir}"/usr/lib/lxqt-panel-profiles
  cp -a  usr/share/ "${pkgdir}"/usr/
  cp usr/bin/"${_pkgname}" "${pkgdir}"/usr/bin/
  cp -a usr/lib/"${_pkgname}"/lxqt-panel-profiles.py "${pkgdir}"/usr/lib/"${_pkgname}"/
  }
