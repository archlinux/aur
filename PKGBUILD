# Contributor: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=google_cloud_translate
pkgname=python-google-cloud-translate
pkgver=3.21.1
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
sha256sums=('760f25e1b979fea6a59dca44ffc8a8dc708693c50ae37a39568ff1284c534be2')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir/" dist/*.whl
}

