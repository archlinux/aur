# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=python-pymatic-git
pkgver=74e32d9
pkgrel=1
pkgdesc='Python library for automating GUI applications (alpha version)'
arch=('x86_64' 'i686')
url='http://github.com/xyproto/pymatic'
license=('GPL2')
depends=('python' 'xautomation' 'xorg-server-xvfb' 'zenity' 'scrot' 'gocr')
source=('pymatic::git://github.com/xyproto/pymatic.git')
md5sums=('SKIP')

pkgver() {
  cd pymatic

  git describe --always | sed 's|-|.|g'
}

check() {
  cd pymatic

  python setup.py test
}

check() {
  cd pymatic

  python setup.py build
}

package() {
  cd pymatic

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/LICENSE"
  install -Dm644 examples/main.py "$pkgdir/usr/share/doc/pymatic/main.py"
}

# vim:set ts=2 sw=2 et:
