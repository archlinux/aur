# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=desec-dns-cli
pkgver=0.0.1
pkgrel=1
pkgdesc="CLI tool for the desec.io DNS service"
arch=("any")
url=https://gitlab.com/XenGi/desec-dns-cli
license=("MIT")
depends=("python>=3.6" "python-click" "python-requests")
makedepends=("python-setuptools")
checkdepends=("python-pytest" "python-pytest-xdist" "python-responses")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=("ed6ecd486f13a707ce19baffd964392ba1a086052c682cc518cb34dd4a5c5ebb")

check() {
    cd "$srcdir/$pkgname-$pkgver"
    #pytest tests/
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

