#Maintainer: stefonarch standreas@riseup.net

_pkgname=lxqt-panel-profiles
pkgname=$_pkgname
pkgver=e7d656b
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
  git describe --always | sed "s/-/.r/;s/-/./"
}

package() {
  cd ${srcdir}/${_pkgname}
  install -dm 755 "${pkgdir}"/usr/share/${_pkgname}
  install -dm 755 "${pkgdir}"/usr/bin
  cp -a  usr/share/ "${pkgdir}"/usr/
  cp usr/bin/"${_pkgname}" "${pkgdir}"/usr/bin/
  }
