# Contributor: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=google_cloud_translate
pkgname=python-google-cloud-translate
pkgver=3.23.0
pkgrel=1
pkgdesc="Google Cloud Translation API client library"
url="https://pypi.org/project/google-cloud-translate/"
depends=(
    'python-google-api-core'
    'python-google-auth'
    'python-google-cloud-core' # AUR
    'python-grpc-google-iam-v1' # AUR
    'python-proto-plus' # AUR
    'python-protobuf'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
license=('Apache-2.0')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('28a31230de80a0fef87ad4fc63ea37d926ee8659f72d55b9d709e908f01395a8')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir/" dist/*.whl
}

