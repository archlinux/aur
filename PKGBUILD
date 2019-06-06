# Maintainer: Federico Cassani <federico dot cassani at outlook dot com> 

pkgname="python-chances"
_pkgname="chances"
pkgver=0.1.6
pkgrel=1
pkgdesc="Chances provides a simple utility to access random methods in a unified manner. The package implements pseudo, quasi, and true random methods, including an actual quantum random method and ambience sound based true random method."
arch=('any')
url="https://github.com/autonomio/chances"
license=('MIT')
depends=('python' 'python-numpy' 'python-requests' 'python-matplotlib')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/7f/8a/e0ce40affac9c5292da615375cd2ce979728b8f5a5d3afd4a9e3acdf9166/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('89d7341544324c8dfe336afba37809313cb247d9962c1da6caadb4276140b1f4')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
