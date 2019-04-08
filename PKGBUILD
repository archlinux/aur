# Maintainer: Andrew Steinke <rkcf@rkcf.me>

pkgname=python-pyparallel
_pkgname=pyparallel
pkgrel=1
pkgver=0.2.2
pkgdesc="Python parallel port access library"
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/pyserial/pyparallel"
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/pyserial/pyparallel/master/LICENSE.txt")
md5sums=('c561af9e15271a1c4690a764d3028999'
         '0051a0dc811ee3fdb17a2fd0be44f3ad')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  cd "$srcdir"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
