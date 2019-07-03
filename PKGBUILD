# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-pygam')
_pkgname='pygam'
pkgver='0.8.0'
pkgrel=1
pkgdesc="Generalized Additive Models in Python"
url="https://pygam.readthedocs.io"
checkdepends=('python-pytest')
depends=('python' 'python-numpy' 'python-progressbar' 'python-scipy')
makedepends=('python-setuptools')
optdepends=('python-scikit-sparse')
license=('GPL-3')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('5cae01aea8b2fede72a6da0aba1490213af54b3476745666af26bbe700479166')

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    pytest
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
