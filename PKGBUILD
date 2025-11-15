# Maintainer: Benevant Mathew <benevantmathewv@gmail.com>

pkgname=fmeta
pkgver=0.1.4
pkgrel=1
pkgdesc="Scan directories and list file metadata in a tabular format."
arch=('any')
url="https://pypi.org/project/fmeta/"
license=('MIT')
depends=('python' 'python-pandas')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('SKIP')  # you can replace SKIP with real checksum later

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

