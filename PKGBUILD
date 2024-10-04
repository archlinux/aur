# Maintainer: bastidest <bastidest at mailbox dot org>

_name=fclist-cffi

pkgname=python-${_name,,}
pkgver=1.1.2
pkgrel=1
pkgdesc="Python cffi bridge to fontconfig's FcFontList/FcFontMatch"
url="https://github.com/MonsieurV/python-fclist"
makedepends=(python-build python-installer python-setuptools)
depends=(python-cffi)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1bb3c039156b8b1913b9e582d4a8f1a48b3d8ea56e5152d604c020874a7e779a')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
