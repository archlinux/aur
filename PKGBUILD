pkgname=govix-calc
pkgver=1.1.1
pkgrel=1
pkgdesc="Govix Calc – A dual-panel calculator built with PySide6"
arch=('any')
url="https://github.com/Kingcat5503/govix-calc"
license=('MIT')
depends=('python' 'pyside6')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    # No build step required for pure Python
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install the Python source files
    install -d "$pkgdir/usr/lib/$pkgname/"
    cp govix_calc/*.py "$pkgdir/usr/lib/$pkgname/"

    # Install the main launcher script
    install -Dm755 govix_calc/main.py "$pkgdir/usr/bin/$pkgname"
    sed -i '1i#!/usr/bin/env python' "$pkgdir/usr/bin/$pkgname"
}
