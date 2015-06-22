# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=python-quamash-git
_pkgname=quamash
pkgver=20150118
pkgrel=1
pkgdesc="Implementation of the asyncio (PEP 3156) event-loop with Qt"
arch=('any')
url="https://github.com/harvimt/quamash"
license=('BSD')
depends=('python-pyqt4')
makedepends=('python-setuptools')
conflicts=('python-quamash')
provides=('python-quamash')
source=('git+https://github.com/harvimt/quamash.git')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
  cd "$srcdir/${_pkgname}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
