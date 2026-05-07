# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=mistralai
pkgname=python-$_name
pkgver=2.4.5
pkgrel=1
pkgdesc="Python Client SDK for the Mistral AI API."
arch=('any')
url="https://github.com/mistralai/client-python"
license=('MIT')
depends=('python' 'python-httpx' 'python-pydantic' 'python-dateutil' 'python-typing-inspection' 'python-opentelemetry-api' 'python-opentelemetry-semantic-conventions' 'python-jsonpath-python')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-google-auth: gcp' 'python-requests: gcp'
            'python-mcp: agents' 'python-griffe: agents' 'python-authlib: agents'
            'python-websockets: realtime')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6f39fc9e5eb29b567fb60b63968ac6161a78c67aff5ae90668e6b7fddadea82e')

build() {
    cd "$srcdir"/client-python-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir"/client-python-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

