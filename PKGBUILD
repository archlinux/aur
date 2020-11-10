# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Simon Doppler <dop dot simon at gmail dot com>

pkgname=python-colored
_name=${pkgname#python-}
pkgver=1.4.2
pkgrel=1
pkgdesc="Very simple Python library for color and formatting in terminal"
arch=('any')
url="https://gitlab.com/dslackw/colored"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('056fac09d9e39b34296e7618897ed1b8c274f98423770c2980d829fd670955ed')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
