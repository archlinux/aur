# Maintainer: Teteros <teteros -at- openmailbox -dot- org>
_pkgname=E17gtk
pkgname=gtk-theme-e17gtk-git
pkgver=V3.22.0.r5.g05b9dca
pkgrel=1
pkgdesc="A dark GTK2/GTK3 theme with sharp corners, which is designed for use in Enlightenment and gives the elegant look of Enlightenment to GTK widgets."
arch=('any')
url="https://github.com/tsujan/${_pkgname}"
license=('GPL')
optdepends=('enlightenment'
			'qt5-styleplugins: GTK+ rendering for QT5')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/tsujan/${_pkgname}")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  mkdir -p "${pkgdir}/usr/share/themes"
  mv "${_pkgname}" "${pkgdir}/usr/share/themes/${_pkgname}"
}
