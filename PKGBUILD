pkgbase=('python2-cookiecheat')
pkgname=('python2-cookiecheat')
_module='pycookiecheat'
pkgver='0.3.1'
pkgrel=2
pkgdesc="Borrow cookies from your browser's authenticated session foruse in Python scripts."
url="https://github.com/n8henrie/pycookiecheat"
depends=('python2' 'python2-cryptography' 'python2-keyring')
makedepends=('python2-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/10/0e/4e1a6245876d431b160436fc5dc93d0d80f2d10f6d21938665f6d5da83c3/pycookiecheat-${pkgver}.tar.gz")
md5sums=('0d8c4b73f2c1f8561a58bb0b7ccbf0a5')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
