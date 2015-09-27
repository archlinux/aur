# Maintainer: Hexchain Tong <i@hexchain.org>

_pkgname=pony
pkgname=("python-$_pkgname" "python2-$_pkgname")
pkgver=0.6.1
pkgrel=1
pkgdesc='Pony Object-Relational Mapper'
arch=('any')
url="http://pypi.python.org/pypi/$_pkgname"
license=('AGPL3')
makedepends=('python-setuptools' 'python2-setuptools')
source=("http://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('f6ef652f72de1fd32d3037ed77005a21')

build() {
  cp -r "$_pkgname-$pkgver" "python2-$_pkgname-$pkgver"

  cd $_pkgname-$pkgver
  python setup.py build

  cd ../python2-$_pkgname-$pkgver
  python2 setup.py build
}

package_python-pony() {
  depends=('python')

  cd $_pkgname-$pkgver
  python setup.py install -O1 --root="$pkgdir"
}

package_python2-pony() {
  depends=('python2')

  cd python2-$_pkgname-$pkgver
  python2 setup.py install -O1 --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
