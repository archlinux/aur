# Contributor: Vlad V. Voronenkov <vladvoronenkov at yandex dot ru>
pkgname=cif2cell
pkgver=2.1.0
pkgrel=1
pkgdesc="A command-line tool to generate the geometrical setup for various electronic structure codes from a CIF format file."
arch=('any')
url="https://cif2cell.sourceforge.io/"
license=('GPLv3')
depends=('python3' 'python-pycifrw')
makedepends=('python-build' 'python-installer' 'python-setuptools')

source=(
 "https://files.pythonhosted.org/packages/49/c0/bda72215a42f325b49efa9fb6985b5e64aba38b01289328663880857c074/$pkgname-$pkgver.tar.gz"
)

build() {
    cd -- "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd -- "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=('3559f5cf395472d8668ed5a16ae8745f97397c07562239c2ab67fd7357661117')
