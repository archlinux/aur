# Maintainer: Sving1024 <sving1024@outlook.com>
_name=dnsstamps
pkgname=python-${_name}
pkgver=1.4.1
pkgrel=1
pkgdesc="Create and parse DNS stamps with ease."
arch=('any')
url="https://github.com/chrisss404/python-dnsstamps"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=('python-dnsstamps')
conflicts=('python-dnsstamps-git')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
noextract=()
sha256sums=('8c6bedc5085daeb1ff79893293e82cbd1a5dc65b689c897a1af971bcbf562d97')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}

check() {
    cd $_name-$pkgver
    python -m unittest discover -vs .
}
