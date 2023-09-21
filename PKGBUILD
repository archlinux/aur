# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=python-pyssim
_name=${pkgname#python-}
pkgver=0.6
pkgrel=1
pkgdesc="Module for computing Structured Similarity Image Metric (SSIM) in Python"
arch=('any')
url="https://pypi.org/project/pyssim"
license=('MIT')
depends=(python-pillow python-scipy)
makedepends=('python-setuptools')
checkdepends=(python-pytest)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
b2sums=('54a66aaf416f4c0f78895431e51a2d24741ee49fa4d8c01592e5d28c41979e6b45468609f1d24fb74486902805415589116b11031772ad561c6d65667e165b46')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver

    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
