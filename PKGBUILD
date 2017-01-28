# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=python-rt-git
pkgver=v1.0.8.r4.gf14fcfc
pkgrel=1
pkgdesc='Interface to the RT (Request Tracker) API'
arch=('any')
url='https://redmine.labs.nic.cz/projects/python-rt'
license=('GPL3')
depends=('python' 'python-six' 'python-nose' 'python-requests')
source=($pkgname::git+https://gitlab.labs.nic.cz/labs/python-rt.git)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "$srcdir/python-rt-git"
  python setup.py build
}

package() {
  cd "$srcdir/python-rt-git"

  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
