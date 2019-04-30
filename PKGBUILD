# Maintainer: Gareth Latty <gareth@lattyware.co.uk>
pkgname=unrpa
pkgver=2.0.1
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
sha256sums=("adbd5830e88e60a13bfb192bddfca37bfd922d40d1e5d061a1fb3b21a608163d"
            "fa987df68ecbb24db36f97535596d1b32dd70ef0b4fab7175c9ba8b3204e1ebe")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
