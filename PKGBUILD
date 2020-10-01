# Maintainer: Michael Riegert <michael at eowyn net>

pkgname=python-pycdlib
_name=pycdlib
pkgver=1.10.0
pkgrel=2
pkgdesc='Python library to read and write ISOs'
arch=('any')
url=https://github.com/clalancette/pycdlib
license=('LGPL2.1')
depends=('python')
makedepends=('python-setuptools')
source=("$_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('761953f8066d7f579139732e01614dd80461b2f595e877ce15000c5d652ef8bd36167200510ac778370c2011bd9c2a9d4211a57205e2643900c868bbc09c76a5')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
