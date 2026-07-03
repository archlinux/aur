# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-google-ai-generativelanguage
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.12.0
pkgrel=1
pkgdesc="Google Ai Generativelanguage API client library"
arch=(any)
url="https://github.com/googleapis/google-cloud-python/tree/main/packages/google-ai-generativelanguage"
license=(Apache-2.0)
groups=()
depends=(python-google-api-core python-google-auth python-grpcio python-proto-plus python-protobuf)
makedepends=(python-build python-installer python-setuptools)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)

sha256sums=('d82f35ade52887476d4586e3cd22fb95492edac47505370e0cb71148168dd94b')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

