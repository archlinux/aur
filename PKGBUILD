# Maintainer: Will Unsworth <unsworthwa at outlook dot com>

pkgname=python-onepassword-sdk
_module='onepassword_sdk'
pkgver=0.4.0
pkgrel=1
pkgdesc='Python SDK for 1Password'
arch=(any)
url="https://github.com/1Password/onepassword-sdk-python"
license=(MIT)
depends=(python python-pydantic)
makedepends=(python-{build,installer,wheel} python-setuptools)
_archive="onepassword_sdk-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('dbfa0914a8eae46ac5a5c924cd0c96ca5be3755b320740a5ef2a389216c2f68e')


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
