# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=flake8-eradicate
pkgname=python-$_pkgname

pkgver=1.4.0
pkgrel=1
pkgdesc="Flake8 plugin to find commented out or dead code"

url='https://github.com/sobolevn/flake8-eradicate'
arch=('any')
license=('MIT')

depends=('python' 'python-setuptools' 'python-eradicate')
makedepends=('python-build' 'python-installer' 'python-wheel')

source=("https://github.com/sobolevn/$_pkgname/archive/$pkgver.zip")
sha512sums=('381039fbffb3cbf964e04fcd15744e0745ef3c2c03440e73ea1dee7af7fb04613a90babd167e0dd0d601a29ac11bbc63b3f4b3883ff80fba44de6b974dc60d08')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
