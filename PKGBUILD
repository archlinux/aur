# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=pyupgrade
pkgver=3.15.0
pkgrel=2
pkgdesc="A tool to automatically upgrade syntax for newer versions of the language"
arch=('any')
url="https://github.com/asottile/pyupgrade"
license=('MIT')
depends=(python python-tokenize-rt)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('a13eca9d5591068355722e0cd0d16debce7c4d55fbce2759af9f0154cf5591beca20bc7e4551d6d707ef63deccf142e639229fb052063be68921c435731dd5ef')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

