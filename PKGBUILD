# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=pyupgrade
pkgver=3.15.0
pkgrel=1
pkgdesc="A tool to automatically upgrade syntax for newer versions of the language"
arch=('any')
url="https://github.com/asottile/pyupgrade"
license=('MIT')
depends=("python" "python-tokenize-rt")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('8a565510066236251c78e8ce62bef749dfcc2b4e4c1ee5b8c977461e4a7d3b6f1e39c1303343af8529ec7a2032d2c7d15e122f98f620a7671cfa47105a137554')

build() {
    cd $pkgname-$pkgver
    python3 setup.py build
}

package() {
    cd $pkgname-$pkgver
    python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

