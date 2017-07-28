# Maintainer: Ross Whitfield <whitfieldre@ornl.gov>
pkgname=('python-periodictable' 'python2-periodictable')
_pkgname='periodictable'
pkgver=1.5.0
pkgrel=1
pkgdesc="Extensible periodic table of the elements"
url="http://www.reflectometry.org/danse/elements.html"
arch=("any")
license=('public domain')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/pkienzle/periodictable/archive/v$pkgver.tar.gz")
md5sums=('f7e0d8199b0fe829868d24a0a734398e')

prepare() {
    cp -a "${srcdir}/${_pkgname}-$pkgver"{,-py2}
}

package_python-periodictable() {
    depends=('python-numpy' 'python-pyparsing')
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-periodictable() {
    depends=('python2-numpy' 'python2-pyparsing')
    cd "$srcdir/${_pkgname}-$pkgver-py2"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
