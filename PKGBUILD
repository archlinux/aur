# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-kintree
_name=${pkgname#python-}
pkgver=0.4.6
pkgrel=2
pkgdesc="Fast part creation in KiCad and InvenTree"
url="https://github.com/sparkmicro/Ki-nTree"
depends=(
    'python'
    'python-digikey-api'
    'python-fuzzywuzzy'
    'python-inventree'
    'python-mouser'
    'python-multiprocess'
    'python-pysimplegui'
    'python-pyaml'
    'python-validators'
    'python-wrapt'
)
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c4a26387bd70893fd0b98cb3bfa0a1d3695aabcc9c7ff0129994dafee7ad7e1e')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
