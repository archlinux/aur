# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=python-pyssim
_name=${pkgname#python-}
pkgver=0.5
pkgrel=1
pkgdesc="Module for computing Structured Similarity Image Metric (SSIM) in Python"
arch=('any')
url="https://pypi.org/project/pyssim"
license=('MIT')
depends=(python-pillow python-scipy python-argparse)
makedepends=('python-setuptools')
checkdepends=(python-pytest)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
b2sums=('65ea5253d898d80b6bbfe930e546a8808ba04d19cac61ab9ec053ca1e31e19c5f8bc1e5c0bdd6f919a27fc75d282213442502e7f4e1f626381fe1d8dcd9a0809')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver

    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
