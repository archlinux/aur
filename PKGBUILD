# Maintainer: Gareth Latty <gareth@lattyware.co.uk>
pkgname=unrpa
pkgver=2.1.0
pkgrel=1
pkgdesc="Extract files from the RPA archive format (from Ren'Py visual novels)."
arch=("any")
url="https://github.com/Lattyware/unrpa"
license=("GPL3")
depends=("python3")
makedepends=("python-setuptools")
optdepends=("python-uncompyle6: ZiX archive support")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Lattyware/$pkgname/archive/$pkgver.tar.gz"
        "https://github.com/Lattyware/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.asc")
validpgpkeys=("92A57AA673039A4491E6D80E5BDD8CFCA5F0551E")
sha256sums=("5c30fa986227f6a010c82ebed052628e6dcbc0e3fa58a880eb70e05e273916c9"
            "dd110f6f9909f063a52bbc636795f160fb4508bf003a5e4ece7e1858d6e7b6c8")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
