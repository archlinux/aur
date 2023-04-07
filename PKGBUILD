
pkgname=python2-zope-interface
# Do not update beyond 5.x. Version 6.x dropped support for Python2.
pkgver=5.5.2
pkgrel=1
pkgdesc='Zope Interfaces for Python 2.x'
license=('ZPL')
arch=('x86_64')
url="https://pypi.python.org/pypi/zope.interface"
depends=('python2' 'glibc')
makedepends=('python2-setuptools')
# Can't be bothered to package these just to run some tests.
#checkdepends=('python2-zope-event' 'python2-zope-testing' 'python2-coverage')
source=("https://pypi.io/packages/source/z/zope.interface/zope.interface-$pkgver.tar.gz")
sha512sums=('ecc20df9b84c91f7a03ce7be087abcd6288f77b2e04f6974ece5b86a222944baf0dc0a2aa49063c74dc7c4d47c474fd01f512c7686164806d48f360667581205')

build() {
  cd "$srcdir"/zope.interface-$pkgver
  python2 setup.py build
}

#check() {
#  cd "$srcdir"/zope.interface-$pkgver
#  PYTHONPATH="$PWD/build/lib.linux-x86_64-2.7" python2 setup.py test
#}

package(){
  cd zope.interface-$pkgver
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
