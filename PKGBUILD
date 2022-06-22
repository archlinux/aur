
pkgname=python2-zope-interface
pkgver=5.4.0
pkgrel=2
pkgdesc='Zope Interfaces for Python 2.x'
license=('ZPL')
arch=('x86_64')
url="https://pypi.python.org/pypi/zope.interface"
depends=('python2' 'glibc')
makedepends=('python2-setuptools')
# Can't be bothered to package these just to run some tests.
#checkdepends=('python2-zope-event' 'python2-zope-testing' 'python2-coverage')
source=("https://pypi.io/packages/source/z/zope.interface/zope.interface-$pkgver.tar.gz")
sha512sums=('ef15d63397e05ad9fc44b2d5d786b0399b6973bb5f4866fab839ff612756f3157f2099d0f5c0469b574a5c8b5920a7c2a5c6eab8e8f84c24d5c43e816669bffe')

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
