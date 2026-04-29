# Maintainer: Dominik Chwirot dchwirot01@gmail.com
pkgname=sealsay
pkgver=2.0.0
pkgrel=1
pkgdesc="CLI app that generates ASCII art of a seal saying a message"
arch=(any)
url="https://github.com/phantypengy/sealsay"
license=('GPL-3.0-or-later')
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)

source=("$pkgname-$pkgver.tar.gz::https://github.com/phantypengy/sealsay/archive/v$pkgver.tar.gz")
sha256sums=('4e862c06f3a72b45020c9e2f6dab379756c0368952c7f85a61fea5a651fcc193')

build() {
    cd "$srcdir/sealsay-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/sealsay-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
