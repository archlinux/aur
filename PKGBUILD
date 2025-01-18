# Maintainer: Dringsim <dringsim@qq.com>

pkgname=python-colour-datasets
_name=colour_datasets
pkgver=0.2.6
pkgrel=1
pkgdesc="Colour science datasets for use with Colour"
arch=('any')
url="https://github.com/colour-science/colour-datasets"
license=('custom:BSD-3-clause')
makedepends=('python-build' 'python-installer' 'python-wheel')
depends=('python-cachetools' 'python-colour-science' 'python-opencv' 'python-tqdm' 'python-xlrd')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('242d93831e9d64fcc411fc7fea010a30d7d739d1e8f9535b3e9526da75222ce4')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
