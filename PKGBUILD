# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Submitter: Simon Zack <simonzack@gmail.com>
# Contributor: Santi Villalba <sdvillal@gmail.com>

pkgname=python-guessit
_name=${pkgname#python-}
pkgver=3.3.0
pkgrel=1
pkgdesc="A library for guessing information from video files."
arch=(any)
url="http://pypi.python.org/pypi/guessit"
license=(LGPL)
depends=(python python-babelfish python-dateutil python-rebulk)
makedepends=("python-setuptools")
conflicts=(${pkgname}-git)
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d49d281836fd410568a16acfac4a0d36bc9f59cc5cd18615b2dcbe10719f64e6')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
