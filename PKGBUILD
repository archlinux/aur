# Maintainer: iamawacko <iamawacko@protonmail.com>
pkgname=tartufo
pkgver=5.0.0
pkgrel=1
pkgdesc="Searches through git repositories for high entropy strings and secrets, digging deep into commit history"
url="https://tartufo.readthedocs.io/"
arch=('any')
license=('GPL-2.0-only')
_name="tartufo"
depends=(python-pygit2 python-gitpython python-click python-colorama python-tomlkit python-cached-property)
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/tartufo/tartufo-$pkgver.tar.gz")
sha256sums=('99ab6652cae6de295aeb31089e9ba27d66d0ad695af493d2d5cbc795397d1c84')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
