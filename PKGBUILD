# Maintainer: Aaruni Kaushik <akaushik@mathematik.uni-kl.de>
_name=tuspy
pkgname="python-${_name}"
pkgver=1.1.0
pkgrel=1
pkgdesc='Python client for uploading files using the tus protocol to any remote server supporting it.'
arch=('any')
url="https://github.com/tus/tus-py-client"
makedepends=('python-setuptools')
license=('MIT')
provides=("python-${_name}")
conflicts=("python-${_name}")
depends=('python' 'python-aiohappyeyeballs' 'python-aiohttp' 'python-aiosignal' 'python-attrs' 
  'python-certifi' 'python-charset-normalizer' 'python-frozenlist' 'python-idna' 'python-multidict'
  'python-requests' 'python-urllib3' 'python-yarl' 'python-tinydb'
  )
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c34a285968c3def36c911c927f7c85f5ef9fd3b63c71f68973aa339baa7abb0e')

package() {
	cd "${srcdir}/tus-py-client-${pkgver}"
	python3 -m build
	python -m installer --destdir="$pkgdir" dist/*.whl
}
