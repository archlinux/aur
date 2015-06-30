# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=python-dg-git
pkgver=da8831f
pkgrel=1
pkgdesc="A programming language running on CPython VM"
arch=('any')
url="https://github.com/pyos/dg/"
license=(MIT)
depends=('python')
makedepends=('python-setuptools')
provides=('python-dg')
source=('git+https://github.com/pyos/dg/') 
sha1sums=('SKIP')
_gitname=dg

pkgver() {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

package() {
  cd "${srcdir}/${_gitname}"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
