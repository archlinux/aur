pkgname=python-pymodbustcp
pkgver=0.3.0
pkgrel=1
pkgdesc='A simple Modbus/TCP library for Python'
arch=('any')
url='https://github.com/sourceperl/pyModbusTCP'
makedepends=(python-build python-installer python-wheel)
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sourceperl/pyModbusTCP/archive/v${pkgver}.tar.gz")
md5sums=('693339cb87cb49c5a75cbd841d112e3f')

build() {
    cd "$srcdir/pyModbusTCP-$pkgver"
    #python setup.py build
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/pyModbusTCP-$pkgver"
    #python setup.py install --root="$pkgdir/" --optimize=1
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
