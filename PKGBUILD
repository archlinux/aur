# Maintainer: Vlad V. Voronenkov <vladvoronenkov at yandex dot ru>
pkgname=cif2cell
pkgver=2.0.0a1
pkgrel=1
pkgdesc="A command-line tool to generate the geometrical setup for various electronic structure codes from a CIF format file."
arch=('any')
url="https://cif2cell.sourceforge.io/"
license=('GPLv3')
depends=('python3' 'python-pycifrw')
makedepends=()

source=(
  "https://files.pythonhosted.org/packages/66/26/d1bd4f5af12adce87ea1a72bf54ec376f2a3cea3e89f1b433b9e3fe5eb8f/$pkgname-$pkgver.tar.gz"
)

build() {
    cd -- "$srcdir/$pkgname-$pkgver"
    python3 setup.py build 
}

package() {
    cd -- "$srcdir/$pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

sha256sums=('7c0e4084afff9b00c4de10d240610ace4289138238408018f619ad19fe82cf56')
