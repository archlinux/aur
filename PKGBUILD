# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-mistralai
_name=${pkgname#python-}
pkgver=1.6.0
pkgrel=1
pkgdesc="You can use the Mistral Python client to interact with the Mistral AI API."
arch=(any)
url="https://github.com/mistralai/client-python"
license=(MIT)
groups=()
depends=(python-pydantic python-orjson python-httpx python-eval-type-backport python-dateutil python-typing_inspect)
optdepends=(python-google-auth python-requests)
makedepends=(python-build python-installer)
provides=(lsbi)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0616b55b694871f0a7d1a4283a53cb904089de7fbfcac1d2c0470d1c77ef879d')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

