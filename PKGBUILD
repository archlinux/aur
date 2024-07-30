# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kicad-gitdiff
_name=${pkgname#python-}
pkgver=0.0.5
pkgrel=2
epoch=
pkgdesc="Simple visual diff for kicad 8 or higher. one can easily extend this tool to build a diff-er for anything that outputs svg."
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
sha256sums=('97cf7c458b76817be7dd5c9b0a3dcb5531fae479900932485917db244662f3a1')

build() {
    cd "${srcdir}/${_name//-/_}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name//-/_}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
