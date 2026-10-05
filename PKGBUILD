# Maintainer: Dominik Chwirot dchwirot01@gmail.com
pkgname=sealsay
pkgver=2.0.2
pkgrel=1
pkgdesc="CLI app that generates ASCII art of a seal saying a message"
arch=(any)
url="https://github.com/phantypengy/sealsay"
license=('GPL-3.0-or-later')
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)

source=("$pkgname-$pkgver.tar.gz::https://github.com/phantypengy/sealsay/archive/v$pkgver.tar.gz")
sha256sums=('78f0a45e43f3703a515898ff89b784ca10ed436e15aa5f1f5659db1328199905')

build() {
    cd "$srcdir/sealsay-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/sealsay-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
