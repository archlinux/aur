# Maintainer: Eric Davis <edavis@insanum.com>
# Maintainer: Samuel Walladge <swalladge at gmail dot com>

pkgname=sncli-git
pkgver=0.148.2b9a20d
pkgrel=1
pkgdesc="Simplenote Command Line Interface"
arch=('any')
url="https://github.com/insanum/sncli"
license=('MIT')
depends=(python2-urwid)
makedepends=('git')
source=('git://github.com/insanum/sncli.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/sncli"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd "$srcdir/sncli"
  python2 setup.py build
}

package() {
  cd "$srcdir/sncli"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
