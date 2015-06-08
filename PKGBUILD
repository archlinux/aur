# Maintainer: Milo Mirate <mmirate at gmx dot com>
_pkgname=pyassuan
pkgname=python-pyassuan-git
pkgver=40.1a08bce
pkgrel=2
pkgdesc="Tools for communicating in the Assuan protocol."
arch=('any')
url="http://blog.tremily.us/posts/pyassuan/"
license=('GPL3')
groups=()
depends=('python')
makedepends=('git')
provides=('python-pyassuan')
conflicts=('python-pyassuan')
replaces=()
backup=()
options=(!emptydirs)
source=('git://tremily.us/pyassuan.git')
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd $_pkgname
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
