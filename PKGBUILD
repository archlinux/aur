# Maintainer: Gareth Latty <gareth@lattyware.co.uk>
pkgname=unrpa
pkgver=2.3.0
pkgrel=2
pkgdesc="Extract files from the RPA archive format (from Ren'Py visual novels)."
arch=("any")
url="https://github.com/Lattyware/unrpa"
license=("GPL-3.0-or-later")
depends=("python3")
makedepends=("python-setuptools")
optdepends=("python-uncompyle6: ZiX archive support")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Lattyware/$pkgname/archive/$pkgver.tar.gz"
        "https://github.com/Lattyware/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.asc")
validpgpkeys=("92A57AA673039A4491E6D80E5BDD8CFCA5F0551E")
sha256sums=("e30684de7098fa7fc657d0cfd9d7d0e2a7fe96f31a964f5ac5f81418a5b4cb7d"
            "6bfd8d7f656af97d987d0fdcc6d044e04593782a73c440785e0667812a940f4e")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
