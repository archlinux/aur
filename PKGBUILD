# Maintainer: Alex Xu <alex_y_xu@yahoo.ca>

pkgname=nyx
pkgver=2.0.4
pkgrel=1
pkgdesc="Command-line status monitor for tor"
arch=(any)
url="https://nyx.torproject.org/"
license=(GPL3)
depends=('python-setuptools' 'stem>=1.6.0')
_pypiname=${pkgname^?}
source=(https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${pkgname}-${pkgver}.tar.gz
	https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${pkgname}-${pkgver}.tar.gz.asc)
md5sums=('14dbd97e35ffcedbe7fd7124a21b3e5e'
         'SKIP')
validpgpkeys=('68278CC5DD2D1E85C4E45AD90445B7AB9ABBEEC6')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    python setup.py install --optimize=1 --root="$pkgdir"
}
