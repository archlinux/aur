# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-class-registry
_pkgname=class-registry
pkgver=4.0.6
pkgrel=1
pkgdesc='The intersection of the Registry and Factory patterns'
url='https://github.com/todofixthis/class-registry'
depends=('python')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
            )
optdepends=()
license=('MIT')
arch=('any')
source=("https://github.com/todofixthis/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('da6d328359aae7488b1a34b4248e480c2f5e9c52e1f82bfeeba2be6d43a6014231fec0c32430e9f73c6761206197bb7e3db0b6bad9c847a5643d1609c3534293')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    install -m644 LICENCE.txt "$pkgdir/usr/share/licenses/$pkgname"
}
