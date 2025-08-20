# Maintainer: Will Unsworth <unsworthwa at outlook dot com>

pkgname=python-onepassword-sdk
_module='onepassword_sdk'
pkgver=0.3.1
pkgrel=1
pkgdesc='Python SDK for 1Password'
arch=(any)
url="https://github.com/1Password/onepassword-sdk-python"
license=(MIT)
depends=(python python-pydantic)
makedepends=(python-{build,installer,wheel} python-setuptools)
_archive="onepassword_sdk-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('ddc6ecd7c7b33fbafe1673196605f309b4b2dfee5a6d2e137a4d18860eb07c3b')


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
