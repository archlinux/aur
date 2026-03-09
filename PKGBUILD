# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-mistralai
_name=${pkgname#python-}
pkgver=1.12.4
pkgrel=1
pkgdesc="You can use the Mistral Python client to interact with the Mistral AI API."
arch=(any)
url="https://github.com/mistralai/client-python"
license=(MIT)
groups=()
depends=(python-pydantic python-eval-type-backport python-dateutil python-typing-inspection python-httpx python-invoke python-opentelemetry-api python-opentelemetry-sdk python-opentelemetry-exporter-otlp-proto-http python-yaml)
optdepends=('python-google-auth: gcp' 'python-requests: gcp' 'python-mcp: agents' 'python-griffe: agents' 'python-authlib: agents' 'python-websockets: realtime')
makedepends=(python-poetry-core python-build python-installer python-wheel)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e52b53bab58025dcd208eeac13e3c3df5778d4112eeca1f08124096c7738929f')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

