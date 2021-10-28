# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Simon Doppler <dop dot simon at gmail dot com>

pkgname=python-colored
_name=${pkgname#python-}
pkgver=1.4.3
pkgrel=1
pkgdesc="Very simple Python library for color and formatting in terminal"
arch=('any')
url="https://gitlab.com/dslackw/colored"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('b7b48b9f40e8a65bbb54813d5d79dd008dc8b8c5638d5bbfd30fc5a82e6def7a')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
