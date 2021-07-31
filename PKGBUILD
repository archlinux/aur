# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-kintree
_name=${pkgname#python-}
pkgver=0.4.1
pkgrel=1
pkgdesc="Fast part creation in KiCad and InvenTree"
url="https://github.com/sparkmicro/Ki-nTree"
depends=(
    'python'
    'python-digikey-api'
    'python-fuzzywuzzy'
    'python-inventree'
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
sha256sums=('8333f45a2a062f82f174d87ef4d97bddd63d2a5d296afc39082ae0dece946b69')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
