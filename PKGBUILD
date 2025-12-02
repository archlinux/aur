# Maintainer: H3mul <phil.d324@gmail.com>
pkgname=python-zoekt-py-git
pkgver=0.1.1
pkgrel=3
pkgdesc="A modern, fully typed Python client and CLI for interacting with Zoekt, a fast, scalable code search engine"
arch=('any')
url="https://github.com/udbhav-44/zoekt-py"
license=('MIT')
depends=('python' 'python-pip')
makedepends=('git')
provides=('zoekt-py')
conflicts=('zoekt-py')
options=('!debug')
source=("git+https://github.com/H3mul/zoekt-py.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/zoekt-py"
    grep version pyproject.toml | head -n 1 | sed 's/version = "\(.*\)"/\1/'
}

build() {
    cd "${srcdir}/zoekt-py"
    python setup.py build
}

package() {
    cd "${srcdir}/zoekt-py"
    pip install --root="${pkgdir}" --no-deps --ignore-installed --prefix="/usr" .
}
