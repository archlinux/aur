# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-google-ai-generativelanguage
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.6.10
pkgrel=1
pkgdesc="Google Ai Generativelanguage API client library"
arch=(any)
url="https://github.com/googleapis/google-cloud-python/tree/main/packages/google-ai-generativelanguage"
license=(Apache-2.0)
groups=()
depends=(python-google-api-core python-google-auth python-proto-plus python-protobuf)
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)

sha256sums=('6fa642c964d8728006fe7e8771026fc0b599ae0ebeaf83caf550941e8e693455')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

