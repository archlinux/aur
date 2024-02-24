# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=python-types-fpdf2
_pkgbasename=${pkgname:7}
pkgver='2.7.8.20240217'
pkgrel=1
pkgdesc="Typing stubs for fpdf2"
arch=('any')
url="https://pypi.org/project/${_pkgbasename}/"
license=('Apache-2.0')
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("https://pypi.io/packages/source/${_pkgbasename:0:1}/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz")
sha256sums=('0e4a69a8214f75e967119980388b627accccff3f27a8e72605ebd954148377e8')
arch=(any)

_fullsrcdir() {
    echo "${srcdir}/${_pkgbasename}-${pkgver}"
}

build() {
    cd "$(_fullsrcdir)"
    python -m build --wheel --no-isolation
}

package() {
    cd "$(_fullsrcdir)"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
