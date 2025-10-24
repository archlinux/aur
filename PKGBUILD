# Maintainer: Sving1024 <sving1024@outlook.com>
_name=dnsstamps
pkgname=python-${_name}-git
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
source=("${_name}::git+https://github.com/chrisss404/python-dnsstamps.git")
noextract=()
sha256sums=('SKIP')

build() {
    cd $_name
    python setup.py build
}

package() {
    cd $_name
    python setup.py install --root="$pkgdir" --optimize=1
}

check() {
    cd $_name
    python -m unittest discover -vs .
}
