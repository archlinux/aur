# Maintainer: Xinc

pkgname=unity-session-shortcuts
_actual_name=session-shortcuts
pkgver=1.4
# For some reason the extracted folder is older than the source file.
_extractedfolder_version=1.3
pkgrel=1
pkgdesc="Allows shutdown, logout, and reboot from dash"
arch=(x86_64)
url="https://launchpad.net/session-shortcuts"
license=(GPL)
depends=(gettext gnome-session)
makedepends=(intltool)
source=("https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/${_actual_name}/${pkgver}/${_actual_name}_${pkgver}.tar.xz")
sha512sums=('SKIP')

build() {
  cd "${_actual_name}"-$_extractedfolder_version
  ./build.sh
}

package() {
  cd "${_actual_name}"-$_extractedfolder_version
  install -d "$pkgdir"/usr/share/applications
  cp -rf build/*.desktop "$pkgdir"/usr/share/applications
}
