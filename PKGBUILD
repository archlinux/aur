# Maintainer: Gabriele Musco <emaildigabry@gmail.com>
# Upstream URL: https://github.com/gabmus/gestureManager

pkgname=gesture-manager-git
pkgver=0.1
pkgrel=1
pkgdesc='Graphical manager for setting libinput-gestures touchpad gestures.'
arch=('any')
url='https://github.com/gabmus/gestureManager'
license=('GPLv3')
depends=('libinput-gestures' 'xf86-input-libinput' 'gtk3>=3.18','python')
makedepends=('git')
source=("gesturemanager::git+git://github.com/gabmus/gestureManager")
md5sums=('SKIP')

package() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/bin
  cp gesturemanager/gesture-manager.desktop.in $pkgdir/usr/share/applications/gesture-manager.desktop
  cp -r gesturemanager $pkgdir/usr/share/gesture-manager
  echo -e "#\!/bin/sh\npython3 /usr/share/gesture-manager/main.py" > $pkgdir/usr/bin/gesture-manager
  chmod +x $pkgdir/usr/bin/gesture-manager
}
