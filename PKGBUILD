# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Simon Doppler <dop dot simon at gmail dot com>

pkgname=python-colored
_name=${pkgname#python-}
pkgver=1.4.4
pkgrel=1
pkgdesc="Very simple Python library for color and formatting in terminal"
arch=('any')
url="https://gitlab.com/dslackw/colored"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('04ff4d4dd514274fe3b99a21bb52fb96f2688c01e93fba7bef37221e7cb56ce0')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
