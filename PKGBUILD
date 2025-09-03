# Maintainer: Nicholas Dahm <(first).(last) at gmail>

# Update process
# Go to PyPI neo4j download page https://pypi.org/project/neo4j/#files
# Get latest URL to tar.gz, extract _pypidir and version
# Download and get sha256 checksum
# profit

pkgname=python-neo4j
_name=${pkgname#python-}
pkgver=5.28.2
pkgrel=0
pkgdesc="Neo4j Bolt driver for Python"
url="https://pypi.org/project/neo4j/"
arch=('any')
license=('GPLv3')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7d38e27e4f987a45cc9052500c6ee27325cb23dae6509037fe31dd7ddaed70c7')

package() {
    cd ${_name}-${pkgver}
    # Note: As of 5.3.0-2 we removed -O1 as part of the switch from setup.py to python -m build/installer
    python -m build
    python -m installer --destdir="${pkgdir}" --prefix=/usr dist/*.whl
}
