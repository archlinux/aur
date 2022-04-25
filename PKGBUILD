# Maintainer: brodokk < brodokk at brodokk dot space>

_pkgname=flake8-print
pkgname=python-$_pkgname

pkgver=4.0.0
pkgrel=1
pkgdesc="Check for Print statements in python files."

url='https://github.com/jbkahn/flake8-print'
arch=('any')
license=('MIT')

depends=(python)
makedepends=(python-build python-installer python-wheel)

source=("https://github.com/JBKahn/$_pkgname/archive/$pkgver.tar.gz")
sha512sums=('cb62bd5a68835c1b5439593259260da7f3ca0c28afe0306cae77d8527d7572b485ab09622b149d67a79671a7f20e9507d6f760a70fda3b48916032dd898f873e')

prepare() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

