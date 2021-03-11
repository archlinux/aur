# Maintainer: Victor Roest <victor@xirion.net>
pkgname=python-papers-cli
_name="${pkgname#python-}"
pkgver=1.0
pkgrel=1
pkgdesc='A Python package to keep your PDF library organized'
arch=('x86_64')
url='https://github.com/perrette/papers'
license=('MIT')
depends=('poppler' 'python-bibtexparser' 'python-scholarly' 'python-rapidfuzz' 'python-six' 'python-unidecode' 'python-crossrefapi')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-v$pkgver.tar.gz")
sha512sums=('39997a178bf9733839f657135b91168aa002a96f09b27cde616a5b13c3f73a6ad452923034d19451e53504fa10e0fb9d5006199fa7c073fc83db14a5e0befd78')

build() {
    cd "$_name-v$pkgver"
    python setup.py build
}

package() {
    cd "$_name-v$pkgver"
    export PYTHONHASHSEED=0
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

