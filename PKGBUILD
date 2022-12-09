# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=pyupgrade
pkgver=3.3.1
pkgrel=1
pkgdesc="A tool to automatically upgrade syntax for newer versions of the language"
arch=('any')
url="https://github.com/asottile/pyupgrade"
license=('MIT')
depends=("python" "python-tokenize-rt")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('b8c9d1e2081b0ee504863bfc41e7bc70e464d5ceb45eacbb983f1fa3596e5a7d275b307b1aa5dcc615569c020ddf6d137abaf2c8f1722c330e377f38a8f6e239')

build() {
    cd $pkgname-$pkgver
    python3 setup.py build
}

package() {
    cd $pkgname-$pkgver
    python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

