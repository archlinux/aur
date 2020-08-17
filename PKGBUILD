# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=python-click-man
_pyname="${pkgname#python-}"
pkgver=0.4.0
pkgrel=1
pkgdesc='Automate generation of man pages for python click applications'
arch=('any')
url="https://pypi.python.org/pypi/$_pyname"
license=('MIT')
depends=('python' 'python-click')
makedepends=('python-setuptools')
source=("https://github.com/click-contrib/$_pyname/archive/v$pkgver.tar.gz")
sha256sums=('a3006cef2f6418e6b78b5186d6e5b291573b4df3b72e8d312c1294a07af1c7a6')

build() {
    cd "$_pyname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pyname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
