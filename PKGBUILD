# Maintainer: Winícius Cota <winicius.cota@gmail.com>
pkgname=python-classproperties
pkgver=0.2.0
pkgrel=1
pkgdesc="Property for class methods."
arch=('any')
url="https://github.com/dpep/pyclassproperties"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/ee/cf/a540ef6bbf6df3192dcb6549a8c84034f5937c5393cefce49f7dec29fead/classproperties-${pkgver}.tar.gz")
sha256sums=('a77e96a666898ecd697dd7f331d9ab1e38383c1edef809d953bb5f8a3ea67c2a')

build() {
    cd "classproperties-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "classproperties-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
