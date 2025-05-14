# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-google-ai-generativelanguage
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.6.18
pkgrel=1
pkgdesc="Google Ai Generativelanguage API client library"
arch=(any)
url="https://github.com/googleapis/google-cloud-python/tree/main/packages/google-ai-generativelanguage"
license=(Apache-2.0)
groups=()
depends=(python-google-api-core python-google-auth python-proto-plus python-protobuf)
makedepends=(python-build python-installer python-setuptools)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)

sha256sums=('274ba9fcf69466ff64e971d565884434388e523300afd468fc8e3033cd8e606e')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

