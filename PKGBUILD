# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kicad-gitdiff
_name=${pkgname#python-}
pkgver=0.0.4
pkgrel=0
epoch=
pkgdesc="Simple visual diff for kicad 7 or higher. one can easily extend this tool to build a diff-er for anything that outputs svg."
arch=('any')
url="https://pypi.org/project/kicad-gitdiff"
license=(Apache-2.0)
groups=()
provides=(${_name})
conflicts=(${_name})
depends=(python
)
makedepends=(python-build
            python-installer
            python-wheel
            python-setuptools)
options=('!strip')
source=("${_name//-/_}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
noextract=()
sha256sums=('e9d709d31dc57cb9e102492f6b5bceeed05affd466aeeaf42af37c6f4cf1946c')

build() {
    cd "${srcdir}/${_name//-/_}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name//-/_}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
