pkgname=govix-calc
pkgver=1.0
pkgrel=1
pkgdesc="Govix Calc – A dual-panel calculator built with PySide6"
arch=('any')
url="https://github.com/Kingcat5503/govix-calc"
license=('MIT')
depends=('python' 'python-pyside6')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install Python source files
    install -d "$pkgdir/usr/lib/govix-calc/"
    cp -r govix_calc/*.py "$pkgdir/usr/lib/govix-calc/"

    # Install launcher
    install -Dm755 main.py "$pkgdir/usr/bin/govix-calc"
    sed -i '1i#!/usr/bin/env python' "$pkgdir/usr/bin/govix-calc"
}
