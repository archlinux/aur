# Maintainer: Sving1024 <sving1024@outlook.com>
_name=dnsstamps
pkgname=python-${_name}
pkgver=1.4.0
pkgrel=2
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
sha256sums=('2fd18598b2f612d0a188d6603c7f8f0cafabb6dbb6dd1311654ab0b7697611f9')

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
