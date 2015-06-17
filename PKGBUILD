# Maintainer: M0Rf30

pkgname='python2-pyleapmouse-git'
pkgver=63.97d8839
pkgrel=1
pkgdesc="A Leap Motion based mouse in Python."
url="https://github.com/pythonian4000/PyLeapMouse"
arch=('any')
license=('unknown')
depends=('python2' 'python2-pyuserinput-git' 'leap-motion-sdk')
source=('git+https://github.com/openleap/PyLeapMouse.git'
	'pyleapmouse')

package() {
  cd PyLeapMouse
  rm -r {OSX,Windows,.gitignore}
  mkdir -p $pkgdir/opt/pyleapmouse
  cp -r * $pkgdir/opt/pyleapmouse
  ln -sr /usr/lib/Leap/libLeap.so $pkgdir/opt/pyleapmouse/Linux
  ln -sr /usr/lib/Leap/Leap.py $pkgdir/opt/pyleapmouse/Linux
  ln -sr /usr/lib/Leap/LeapPython.so $pkgdir/opt/pyleapmouse/Linux
  install -Dm644 ../pyleapmouse $pkgdir/usr/bin/pyleapmouse
  chmod +x $pkgdir/usr/bin/pyleapmouse
}

pkgver() {
  cd PyLeapMouse
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP'
         'e32194507284896d6335364073ed0874')
