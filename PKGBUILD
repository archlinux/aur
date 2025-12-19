# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-mistralai
_name=${pkgname#python-}
pkgver=1.10.0
pkgrel=1
pkgdesc="You can use the Mistral Python client to interact with the Mistral AI API."
arch=(any)
url="https://github.com/mistralai/client-python"
license=(MIT)
groups=()
depends=(python-pydantic python-eval-type-backport python-dateutil python-typing_inspect python-httpx)
optdepends=('python-google-auth: gcp' 'python-requests: gcp' 'python-mcp: agents' 'python-griffe: agents' 'python-authlib: agents')
makedepends=(python-poetry-core python-build python-installer python-wheel)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c92e9a5ec7057577b326d47a4b1c186f42660bccbe95167fc25c686fe658ad23')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

