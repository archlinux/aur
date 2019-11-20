# maintainer Storm Dragon <stormdragon2976@gmail.com>

pkgbase='python-spake2'
_pkgname='spake2'
pkgname=('python2-spake2' 'python-spake2')
pkgver=0.8
pkgrel=5
pkgdesc="This library implements the SPAKE2 password-authenticated key exchange"
arch=('any')
url="https://pypi.python.org/packages/10/7d/${_pkgname}-${pkgver}"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('0155bad518bb49c39994fe0b7d9fb32c')

prepare() {
  cp -a ${_pkgname}-${pkgver}{,-py2}  
}

build() {
  cd "$srcdir"/${_pkgname}-${pkgver}
  python setup.py build
  cd "$srcdir"/${_pkgname}-${pkgver}-py2
  python2 setup.py build
}
 
package_python-spake2() {
  depends=('python' 'python-hkdf')                                                                                                                                
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-spake2() {
  depends=('python2' 'python2-hkdf')                                                                                                                                
  cd "$srcdir/${_pkgname}-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
