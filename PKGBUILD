# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=python38-jsonpointer
pkgver=2.3
pkgrel=1
pkgdesc="Identify specific nodes in a JSON document (RFC 6901)"
arch=('any')
url="https://github.com/stefankoegl/python-json-pointer"
license=('BSD')
depends=('python38')
makedepends=('python38-setuptools')
source=("https://pypi.io/packages/source/j/jsonpointer/jsonpointer-$pkgver.tar.gz")
sha512sums=('e04da474a5ec376d1cd2c764c2d7a11ac296450df199449994cb1dedf02a49df3ae3a4e75b2963370dba1da166464602b849a79609f7a98d8246dab0b342c819')

build() {
    cd "$srcdir"/jsonpointer-$pkgver
    python3.8 setup.py build
}

check() {
    cd "$srcdir"/jsonpointer-$pkgver
    python3.8 tests.py
}

package_python38-jsonpointer() {
    cd jsonpointer-$pkgver
    python setup.py install --prefix=/usr --root="$pkgdir"
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
