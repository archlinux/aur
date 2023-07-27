# Maintainer: Silvan Gümüsdere <silvan@trollbox.org>

pkgname=python-opensearch
_name=opensearch-py
pkgver=2.3.0
pkgrel=1
pkgdesc='Python Client for OpenSearch'
arch=('any')
url='https://github.com/opensearch-project/opensearch-py'
license=('Apache')
depends=('python-urllib3' 'python-requests' 'python-six' 'python-dateutil')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('493b224d0f865f62663f689c3a7662b1edccf9ee6c7643f2561cafda04e3a66a')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

