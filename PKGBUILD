# Maintainer: Jose Riha <jose1711 gmail com>

pkgname='python-lingua'
_module='lingua'
pkgver='4.15.0'
pkgrel=1
pkgdesc="Translation toolset"
url="https://github.com/wichert/lingua"
depends=('python')
makedepends=('python-setuptools')
license=('custom:DFSG approved')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('0e1a946741db288a40361ad04ff38fe04bf0819834b8abb84c4b535fed9ba4ef')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
