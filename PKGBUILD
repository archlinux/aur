# Maintainer: Alex S. shantanna_at_hotmail_dot_com>

pkgname=gnome-shell-extension-drop-down-terminal-x-git
_pkgname=drop-down-terminal-x
pkgver=1.0.1.r2.gfd64bc8
pkgrel=1
pkgdesc="Another extended Drop Down Terminal extension for the Gnome Shell."
arch=('any')
url="https://https://github.com/bigbn/drop-down-terminal-x.git"
license=('GPL3')
conflicts=(	'gnome-shell-extension-drop-down-terminal'
			'gnome-shell-extension-drop-down-terminal-git'
			'gnome-shell-extension-drop-down-terminal-x')
depends=('gnome-shell')
makedepends=('git')
source=('git+https://github.com/bigbn/drop-down-terminal-x.git')
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  _extid='drop-down-terminal-x@bigbn.pro'
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
  cp -af "${_pkgname}/${_extid}" "${pkgdir}/usr/share/gnome-shell/extensions/"
}
