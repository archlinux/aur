# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: icasdri <icasdri at gmail dot com>
# Contributor: hexchain <i@hexchain.org>

pkgname=python38-mypy_extensions
pkgver=0.4.3
pkgrel=5
pkgdesc='Experimental type system extensions for programs checked with the mypy typechecker'
url="http://www.mypy-lang.org/"
arch=('any')
license=('MIT')
depends=('python38')
makedepends=('python38-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://pypi.org/packages/source/m/mypy_extensions/mypy_extensions-$pkgver.tar.gz")
sha256sums=('2d82818f5bb3e369420cb3c4060a7970edba416647068eb4c5343488a6c604a8')

build() {
    cd "mypy_extensions-$pkgver"
    python3.8 setup.py build
}

package() {
    cd "mypy_extensions-$pkgver"
    python3.8 setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
