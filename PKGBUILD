#Maintainer for the system tray: georgo10@gmail.com
#Original creators of onedrive-d
# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Pietro Brenna <pietrobrenna@zoho.com>
# Contributor: Joey Dumont <joey.dumont@gmail.com>

pkgname=onedrive-d-systemtray
_pkgname=onedrive-d-systemtray
pkgver=20151103.gfee6133
pkgrel=2
pkgdesc="System tray icon for Microsoft OneDrive service (onedrive-d)"
url="https://gitlab.com/rich4rd.macwan/onedrive-d-systemtray"
license=('LGPL')
arch=('i686' 'x86_64')
provides=('onedrive-d-systemtray')
depends=('onedrive-d-git' 'python-pyqt4')
makedepends=('git')
_gitname="onedrive-d-systemtray"
source=("${_pkgname}::git+https://gitlab.com/rich4rd.macwan/onedrive-d-systemtray.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git log -1 --format="%cd.g%h" --date=short | sed 's/-//g'
}

build() {
  cd "$srcdir/$_pkgname"
  #python setup.py build
  
}

package() {
  cd "$srcdir/$_pkgname"
  #python setup.py install --root="$pkgdir/" --optimize=1
  #python setup.py clean
  #install -D onedrive_d/res/icon_256.png \
  #  "$pkgdir/usr/share/pixmaps/onedrive-d.png"
  #install -D ../onedrive-d.desktop \
  #  "$pkgdir/usr/share/applications/onedrive-d.desktop"
  install -d "$pkgdir"/usr/share/pixmaps/onedrive-d
  install -D "$srcdir/$_pkgname"/icons/*.png "$pkgdir"/usr/share/pixmaps/onedrive-d
  install -D $pkgname "$pkgdir"/usr/bin/$pkgname
}
