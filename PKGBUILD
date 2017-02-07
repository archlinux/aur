# Maintainer: Benoit Pierre <benoit.pierre@gmail.com>

pkgname=plover
pkgdesc="Free and open source real-time stenography engine."
pkgver=3.1.0
pkgrel=1
arch=('any')
license=('GPL2')
depends=(
  'python2'
  'python2-appdirs'
  'python2-dbus'
  'python2-hidapi'
  'python2-pyserial'
  'python2-setuptools'
  'python2-six'
  'python2-xlib'
  'wmctrl'
  'wxpython'
)
makedepends=(
  'python2-mock'
  'python2-pytest'
  'python2-setuptools-scm'
)
provides=('plover')
conflicts=('plover-git')
url="http://www.openstenoproject.org/plover/"
source=(https://github.com/openstenoproject/plover/releases/download/v$pkgver/plover-$pkgver.tar.gz)
sha1sums=(20dc0391db86d2661f93298b350f36ecf8042f8e)

check() {
  cd "$pkgname-$pkgver"
  python2 setup.py test
}

package() {
  cd "$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir"
  chmod og+rX -R "$pkgdir"
}

# vim:set sw=2 sts=2 et:
