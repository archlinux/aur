# Maintainer: Alex Xela <h825@pm.me>

pkgname=python-poetry-multiproject-plugin
_pkgname=poetry_multiproject_plugin
pkgver=1.3.2
pkgrel=1
pkgdesc='A Poetry plugin that makes it possible to use relative package includes.'
arch=(any)
url="https://github.com/DavidVujic/poetry-multiproject-plugin"
license=(MIT)
depends=(python python-cleo python-poetry)
makedepends=(python-build python-installer)
source=(https://codeload.github.com/DavidVujic/poetry-multiproject-plugin/tar.gz/refs/tags/v${pkgver})
sha256sums=('5871be50809a1fb915f04c2918b73ac3710b647372f7a5434fca2de6fb2b68de')

build() {
    cd "poetry-multiproject-plugin-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "poetry-multiproject-plugin-$pkgver"
    python -m installer -d "$pkgdir" dist/*.whl
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/poetry-multiproject-plugin/"
}
