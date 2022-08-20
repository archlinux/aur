# Maintainer: Qirui Wang <wqr.prg@gmail.com>
# Contributor: Carl George < arch at cgtx dot us >

_name="sanic-routing"
pkgname="python-$_name"
pkgver=22.8.0
pkgrel=1
pkgdesc='Internal handler routing for Sanic beginning with v21.3.'
arch=("any")
url='https://sanicframework.org/'
license=("MIT")
makedepends=("python-setuptools")
source=("https://github.com/sanic-org/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('728cd7009803d81872f5dbf49b4f795d503c6056522f0d0aaf525607b7217849')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/licence"
}
