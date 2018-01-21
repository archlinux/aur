# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: tocer <tocer.deng@gmail.com>

_name=fudge
pkgname=(python-$_name python2-$_name)
pkgver=1.1.1
pkgrel=1
pkgdesc="Use fake objects (mocks, stubs, etc) to test real ones"
arch=(any)
url="http://farmdev.com/projects/fudge/"
license=(MIT)
makedepends=('python-setuptools' python2-setuptools)
optdepends=('python-fudge-docs: documentation for Fudge')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('3aefdd12c3e0518665fe6735b24a0f9b')

package_python-fudge() {
  cd "$srcdir/fudge-$pkgver"
  depends=('python')
  python setup.py install --root=$pkgdir/ --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

package_python2-fudge() {
  cd "$srcdir/fudge-$pkgver"
  depends=('python2')
  python2 setup.py install --root=$pkgdir/ --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
