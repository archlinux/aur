# Maintainer: Kwpolska <kwpolska@kwpolska.tk>
pkgname=python-pillow-git
_pyname=Pillow
pkgver=1.7.6.r1267.gbed2e42
pkgrel=1
pkgdesc='Python Imaging Library (PIL) fork. (git, Python 3)'
arch=('any')
url='https://github.com/python-imaging/Pillow'
license=('custom:PIL')
depends=('python')
makedepends=('git')
options=(!emptydirs)
provides=('python3-imaging')
conflicts=('python3-imaging')
source=('git://github.com/python-imaging/Pillow.git')
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/Pillow"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/Pillow"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
