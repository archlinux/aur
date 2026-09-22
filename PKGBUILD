# Maintainer: Silvan Gümüsdere <silvan@trollbox.org>

pkgname=python-opensearch
_name=opensearch-py
_alt_name=opensearch_py
pkgver=3.2.0
pkgrel=2
pkgdesc='Python Client for OpenSearch'
arch=('any')
url='https://github.com/opensearch-project/opensearch-py'
license=('Apache-2.0')
conflicts=('python-opensearch-git')
depends=(
    'python'
    'python-urllib3'
    'python-requests'
    'python-dateutil'
    'python-certifi'
    'python-events'
)
makedepends=('python-setuptools')
optdepends=(
    'python-aiohttp'
)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_alt_name}-${pkgver}.tar.gz")
sha256sums=('f40fb3a295275422df2ad6d9459f667af94472d5a9e567072e9ecf163eb22613')

build() {
    cd "${_alt_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_alt_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

