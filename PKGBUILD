# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-google-ai-generativelanguage
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.6.8
pkgrel=3
pkgdesc="Google Ai Generativelanguage API client library"
arch=(any)
url="https://github.com/googleapis/google-cloud-python/tree/main/packages/google-ai-generativelanguage"
license=(Apache-2.0)
groups=()
depends=(python-google-api-core python-google-auth python-proto-plus python-protobuf)
makedepends=(python-build python-installer)
provides=(lsbi)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bd009e62c67e853892ad2029debbee2a67a5bfd2601f3a1cd6aa33ea91c8619b')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

