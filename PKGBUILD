pkgname=python-pymodbustcp
pkgver=0.2.1
pkgrel=1
pkgdesc='A simple Modbus/TCP library for Python'
arch=('any')
url='https://github.com/sourceperl/pyModbusTCP'
makedepends=('python-setuptools')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sourceperl/pyModbusTCP/archive/v${pkgver}.tar.gz")
md5sums=('bb86f6698d97ca2898f9ddc076a2e797')

build() {
    cd "$srcdir/pyModbusTCP-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/pyModbusTCP-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
