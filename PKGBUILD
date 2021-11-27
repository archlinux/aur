# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-kintree
_name=${pkgname#python-}
pkgver=0.4.8
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
sha256sums=('15c46c1f4a4f9f98e357ea3e01b5d84467b4e13fa25c069fc44d73889490b99e')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
