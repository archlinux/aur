# Maintainer: Eric Davis <edavis@insanum.com>
# Maintainer: Samuel Walladge <swalladge at gmail dot com>

pkgname=sncli-git
pkgver=0.156.7c31503
pkgrel=1
pkgdesc="Simplenote Command Line Interface"
arch=('any')
url="https://github.com/insanum/sncli"
license=('MIT')
depends=('python-urwid' 'python-requests')
makedepends=('git')
source=('git://github.com/insanum/sncli.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/sncli"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd "$srcdir/sncli"
  python setup.py build
}

package() {
  cd "$srcdir/sncli"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
