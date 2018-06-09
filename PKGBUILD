
# Maintainer: Simon Tas <simon.tas.st@gmail.com>
pkgname="python-romkan"
_pkgname="romkan"
pkgver=0.2.1
pkgrel=1
pkgdesc="a Romaji/Kana conversion library for Python"
arch=('any')
url="https://pypi.python.org/pypi/$_pkgname"
license=('BSD')
depends=('python')
provides=('python-romkan')
source=("https://pypi.io/packages/source/r/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('e65645dc06dba10429e4646ac804ef82')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    
    python setup.py install --root="${pkgdir}" --optimize=1
    
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
