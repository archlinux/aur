# Maintainer: iamawacko <iamawacko@protonmail.com>
pkgname=tartufo
pkgver=5.0.2
pkgrel=1
pkgdesc="Searches through git repositories for high entropy strings and secrets, digging deep into commit history"
url="https://tartufo.readthedocs.io/"
arch=('any')
license=('GPL-2.0-only')
_name="tartufo"
depends=(python-pygit2 python-gitpython python-click python-colorama python-tomlkit python-cached-property)
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/tartufo/tartufo-$pkgver.tar.gz")
sha256sums=('d7f680da7aadc91840d2bde2605a9e71fa635ac1c6ee39490fb11e9a1494ff58')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
