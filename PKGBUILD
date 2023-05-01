# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=pyupgrade
pkgver=3.3.2
pkgrel=1
pkgdesc="A tool to automatically upgrade syntax for newer versions of the language"
arch=('any')
url="https://github.com/asottile/pyupgrade"
license=('MIT')
depends=("python" "python-tokenize-rt")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('8fe62cb15f2e20e5358e8e22d5bff5f9b8b65923493660c62961b26b7ed99225115c3970999ef8215b55db3f08fd2f554c79ee52f9e191edc6ceaf5c85f3c516')

build() {
    cd $pkgname-$pkgver
    python3 setup.py build
}

package() {
    cd $pkgname-$pkgver
    python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

