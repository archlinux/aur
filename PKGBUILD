# Maintainer: Silvan Gümüsdere <silvan@trollbox.org>

pkgname=python-opensearch
_name=opensearch-py
pkgver=2.2.0
pkgrel=1
pkgdesc='Python Client for OpenSearch'
arch=('any')
url='https://github.com/opensearch-project/opensearch-py'
license=('Apache')
depends=('python-urllib3' 'python-requests' 'python-six' 'python-dateutil')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('109fe8d2e1e8f419a22358eb901025f51e6ad2f50014c8962e23796b2a23cb67')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

