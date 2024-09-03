# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-google-ai-generativelanguage
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.6.6
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
#source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
source=(https://files.pythonhosted.org/packages/28/38/3d717e70a0020cde7bef8ec998ef3c605f208cc77ba93d22450e09f4d4ee/google-ai-generativelanguage-0.6.6.tar.gz)

sha256sums=('1739f035caeeeca5c28f887405eec8690f3372daf79fecf26454a97a4f1733a8')

build() {
    #cd "$srcdir/$_name-$pkgver"
    cd "$srcdir/${_name//_/-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    #cd "$srcdir/$_name-$pkgver"
    cd "$srcdir/${_name//_/-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

