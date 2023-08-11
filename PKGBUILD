# Maintainer: Victor Roest <victor@xirion.net>
pkgname=python-crossrefapi
_name=${pkgname#python-}
pkgver=1.6.0
pkgrel=1
pkgdesc='Python Library that implements the endpoints of the Crossref API'
arch=('x86_64')
url='https://github.com/fabiobatalha/crossrefapi'
license=('BSD')
depends=('python-requests')
makedepends=('python-poetry')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('78ca93a17c15e0d094b0e06054ec74ff13f8fe29ec3ce73ec768f8b197e620e4baac238c22bac802f9e5ea0498f4554c91d187e5b7ddaf87a717123e87778e26')

build() {
    cd "$_name-$pkgver"
    poetry build
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

