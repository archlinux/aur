# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Ross Whitfield <whitfieldre@ornl.gov>
pkgname='python-periodictable'
_pkgname='periodictable'
pkgver=2.0.2
pkgrel=1
pkgdesc="Extensible periodic table of the elements"
url="http://periodictable.readthedocs.org"
arch=("any")
license=('public domain')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pkienzle/periodictable/archive/v$pkgver.tar.gz")
md5sums=('cafa51731c6693e1f85a6f7a7bcff393')

build() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python -m build --wheel --no-isolation
}
package() {
    depends=('python' 'python-matplotlib' 'python-numpy' 'python-pyparsing' 'python-uncertainties')
    cd "$srcdir/${_pkgname}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
