# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-kintree
_name=${pkgname#python-}
pkgver=0.5.2
pkgrel=1
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
sha256sums=('84112e6ad01e2bc6b0915eb6d9ef464a50a0a23d136b290d995da80f252c136d')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
