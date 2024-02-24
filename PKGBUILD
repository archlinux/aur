# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=python-imgdiff
_pkgbasename=${pkgname:7}
pkgver=1.7.1
pkgrel=1
pkgdesc='Compare two images side-by-side'
arch=(any)
url="https://pypi.org/project/${_pkgbasename}/"
license=(MIT)
depends=(python python-pillow)
makedepends=(python-build python-installer python-wheel)
source=("https://pypi.io/packages/source/${_pkgbasename:0:1}/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz")
sha256sums=('c8f947c84f8575009911b005ccd7a0e7edd6e53e8b07a623e4bac23df1419c9e')
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
