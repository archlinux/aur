# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=pyupgrade
pkgver=3.21.2
pkgrel=1
pkgdesc="A tool to automatically upgrade syntax for newer versions of the language"
arch=('any')
url="https://github.com/asottile/pyupgrade"
license=('MIT')
depends=(python python-tokenize-rt)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('73753913d1f6493d271214b567b374ab0d4cd32cc4f385746fd8ce58157adfd4ce195184d25cd79efbc23186d8825e92d7cce6ac19c81ab9f7e27b897dd6710c')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

