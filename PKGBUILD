# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-mistralai
_name=${pkgname#python-}
pkgver=1.5.0
pkgrel=2
pkgdesc="You can use the Mistral Python client to interact with the Mistral AI API."
arch=(any)
url=""
license=(MIT)
groups=()
depends=(python-pydantic python-orjson python-httpx python-eval-type-backport python-jsonpath-python python-dateutil python-google-auth python-requests python-typing_inspect)
makedepends=(python-build python-installer)
provides=(lsbi)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fd94bc93bc25aad9c6dd8005b1a0bc4ba1250c6b3fbf855a49936989cc6e5c0d')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

