# Maintainer: Vidar Magnusson <printit at vidarmagnusson dot com>

pkgname=printit
pkgver=1.0.1
pkgrel=1
pkgdesc="Utility for printing at Chalmers University"
arch=("any")
url="https://github.com/viddem/$pkgname"
makedepends=("git")
depends=("python>=3" "python-requests" "python-setuptools" "python-pip")
source=("$pkgname-$pkgver::git+$url.git")
sha256sums=("SKIP")
license=('AGPL3')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}