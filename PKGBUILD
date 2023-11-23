# Maintainer: Silvan Gümüsdere <silvan@trollbox.org>

pkgname=python-opensearch
_name=opensearch-py
pkgver=2.4.2
pkgrel=1
pkgdesc='Python Client for OpenSearch'
arch=('any')
url='https://github.com/opensearch-project/opensearch-py'
license=('Apache')
depends=('python-urllib3' 'python-requests' 'python-six' 'python-dateutil')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('564f175af134aa885f4ced6846eb4532e08b414fff0a7976f76b276fe0e69158')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

