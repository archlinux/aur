# Maintainer: Lex Black <autumn-wind at web dot de>

_pkgname=Rofication
pkgname=rofication-git
pkgver=r17.8dbd06d
pkgrel=1
pkgdesc="minimalistic notification system loosely modeled after notification centers like on android and windows 10 (git version)"
arch=('any')
url="https://github.com/DaveDavenport/Rofication"
license=('GPL')
depends=('python-dbus' 'python-gobject' 'python-jsonpickle')
conflicts=('rofication')
provides=('rofication' 'notification-daemon')
source=("git://github.com/DaveDavenport/Rofication.git")
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd ${_pkgname}

  install -m755 -D msg.py $pkgdir/usr/bin/msg.py
  install -m755 -D rofication-{daemon,gui,statusi3blocks}.py $pkgdir/usr/bin/
}
