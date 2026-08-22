# Maintainer: Will Unsworth <unsworthwa at outlook dot com>

pkgname=python-onepassword-sdk
_module='onepassword_sdk'
pkgver=0.4.1
pkgrel=1
pkgdesc='Python SDK for 1Password'
arch=(any)
url="https://github.com/1Password/onepassword-sdk-python"
license=(MIT)
depends=(python python-pydantic)
makedepends=(python-{build,installer,wheel} python-setuptools)
_archive="onepassword_sdk-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('4b9224208aa6e35e13bad8534e6521d3abf5ba166ea4efd370fcdc918c4a4d26')


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
