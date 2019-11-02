# Maintainer: Gareth Latty <gareth@lattyware.co.uk>
pkgname=unrpa
pkgver=2.2.0
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
sha256sums=("a85bc053b2401c3739db9f173ae3c277caaa917d96fec2bab61aecc6f2922dcc"
            "841511d411c031fbf1af23234f39834285520d62c9d6546892e20acc939fbaed")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
