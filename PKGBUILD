# Maintainer: Federico Cassani <federico dot cassani at outlook dot com> 

pkgname="python-chances"
_pkgname="chances"
pkgver=0.1.9
pkgrel=1
pkgdesc="Chances provides a simple utility to access random methods in a unified manner. The package implements pseudo, quasi, and true random methods, including an actual quantum random method and ambience sound based true random method."
arch=('any')
url="https://github.com/autonomio/chances"
license=('MIT')
depends=('python' 'python-numpy' 'python-requests' 'python-matplotlib')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/fa/d8/d61112d7476dc3074b855f1edd8556cde9b49b7106853f0b060109dd4c82/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('bcd4e524ec3085100ef918b64e53c4d3a404d73bc35b5b4dbf4df2ce1d1635c4')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
