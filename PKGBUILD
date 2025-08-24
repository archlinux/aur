# Maintainer: Network_Jack <Network_Jack@null.net>

pkgname=python-neobolt
_pypiname=neobolt
_pypidir="8b/f9/d92485b99ffd557d5020bd30e9f8dae49abdad23623b15113d72f2fbe18f"
pkgver=1.7.17
pkgrel=2
pkgdesc="Neo4j Bolt connector for Python"
url="https://pypi.org/project/neobolt/"
arch=('any')
license=('GPLv3')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=(${_pypiname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/${_pypidir}/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('1d0d5efce7221fc4f0ffc4a315bc5272708be5aa2aef5434269e800372d8db89')


build() {
    cd "${_pypiname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pypiname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
