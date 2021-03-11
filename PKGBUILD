# Maintainer: Victor Roest <victor@xirion.net>
pkgname=python-crossrefapi
_name=${pkgname#python-}
pkgver=1.5.0
pkgrel=1
pkgdesc='Python Library that implements the endpoints of the Crossref API'
arch=('x86_64')
url='https://github.com/fabiobatalha/crossrefapi'
license=('BSD')
depends=('python-requests')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('d6c6250e1c009e1cc960236a11b6fee9c64fe990c8cd879eca52684702a202f14668774d9a9959dc10c7a958908b4e7977fca0d989479817c303da0aa4839fbe')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    export PYTHONHASHSEED=0
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

