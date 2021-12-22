# Maintainer: Vlad V. Voronenkov <vladvoronenkov at yandex dot ru>
pkgname=cif2cell
pkgver=2.0.0a3
pkgrel=1
pkgdesc="A command-line tool to generate the geometrical setup for various electronic structure codes from a CIF format file."
arch=('any')
url="https://cif2cell.sourceforge.io/"
license=('GPLv3')
depends=('python3' 'python-pycifrw')
makedepends=()

source=(
 "https://files.pythonhosted.org/packages/0d/a4/ef5cfc41320afa99610f8693901df0f827fd774543140bcaed6c8a636475/$pkgname-$pkgver.tar.gz"
)

build() {
    cd -- "$srcdir/$pkgname-$pkgver"
    python3 setup.py build 
}

package() {
    cd -- "$srcdir/$pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

sha256sums=('4875c0bc45caca743327b1245bdf63d902a980e0f09799c9671609126134719d')
