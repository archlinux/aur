# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
_pkgname=google-cloud-translate
pkgname=python-google-cloud-translate
pkgver=3.7.4
pkgrel=1
pkgdesc="Google Cloud Translation API client library"
url="https://pypi.org/project/google-cloud-translate/"
depends=('python' 'python-google-cloud-core' 'python-google-api-core' 'python-grpcio' 'python-proto-plus' 'python-protobuf')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-google-cloud-testutils' 'python-mock')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")

sha256sums=('079301a5d712e8d37baf0be32f06d8e79ad5d1d2c3c16b6701a756b07d80c171')

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    pytest tests
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

