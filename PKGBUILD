# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=python-diffimg
_pkgbasename=${pkgname:7}
pkgver=0.3.0
pkgrel=3
pkgdesc='Get the % difference in images + generate a diff image'
arch=(any)
url="https://pypi.org/project/${_pkgbasename}/"
license=(MIT)
depends=(python python-pillow)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_pkgbasename::1}/${_pkgbasename//-/_}/${_pkgbasename//-/_}-$pkgver.tar.gz")
sha256sums=('5f9bfc5417430729205b70e68f22bade19fed43d963daa7fb45d9447d0a01a24')
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
