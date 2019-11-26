# Maintainer: Ritwick Verma <verma1997@gmail.com>
# Upstream URL: https://github.com/RitwickVerma/Gesture-Manager-X

pkgname=gesture-manager-x-git
pkgver=0.1
pkgrel=1
pkgdesc='GUI for setting libinput-gestures touchpad gestures with extended support for newer gestures.'
arch=('any')
url='https://github.com/RitwickVerma/Gesture-Manager-X'
license=('GPLv3')
depends=('libinput-gestures' 'xf86-input-libinput' 'gtk3>=3.18','python')
makedepends=('git')
source=("gesturemanagerx::git+git://github.com/RitwickVerma/Gesture-Manager-X")
md5sums=('SKIP')

package() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/bin
  cp gesturemanagerx/gesture-manager-x.desktop.in $pkgdir/usr/share/applications/gesture-manager-x.desktop
  cp -r gesturemanagerx $pkgdir/usr/share/gesture-manager-x
  echo -e "#!/bin/sh\npython3 /usr/share/gesture-manager-x/main.py" > $pkgdir/usr/bin/gesture-manager-x
  chmod +x $pkgdir/usr/bin/gesture-manager-x
}
