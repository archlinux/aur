# Maintainer: Nicholas Dahm <(first).(last) at gmail>

# Update process
# Go to PyPI neo4j download page https://pypi.org/project/neo4j/#files
# Get latest URL to tar.gz, extract _pypidir and version
# Download and get sha256 checksum
# profit

pkgname=python-neo4j
_name=${pkgname#python-}
pkgver=5.3.0
pkgrel=1
pkgdesc="Neo4j Bolt driver for Python"
url="https://pypi.org/project/neo4j/"
arch=('any')
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0c1c7d8812eed60da0a442d1e0f35edbda248255703e506a081cb70e083b3b5c')

package() {
    cd ${_name}-${pkgver}
    python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
