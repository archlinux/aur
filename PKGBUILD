# Maintainer: Mohamed Tarek <Mokhamed_tarek@mail.ru>
# Contributor: Tomislav Ivek <tomislav.ivek@gmail.com>
# Contributor: Carl George < arch at cgtx dot us >

_name="pluginbase"
_module="$_name"

pkgname=("python-$_module")
pkgver=1.0.1
pkgrel=0
pkgdesc="A support library for building plugins systems in Python."
arch=("any")
url="https://pypi.org/project/pluginbase"
license=("BSD-3-Clause")
makedepends=("python-setuptools")
depends=("python")
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/f3/07/753451e80d2b0bf3bceec1162e8d23638ac3cb18d1c38ad340c586e90b42/pluginbase-${pkgver}.tar.gz")
sha256sums=('ff6c33a98fce232e9c73841d787a643de574937069f0d18147028d70d7dee287')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package_python-pluginbase() {
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
