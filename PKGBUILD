# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-curated-tokenizers
_name=${pkgname#python-}
pkgver=2.0.0
pkgrel=1
epoch=
pkgdesc="Lightweight piece tokenization library"
arch=('any')
url="https://pypi.org/project/${_name}"
_name=${_name//-/_}
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    gcc-libs
    glibc
    python
    python-pytest
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=()
options=('!strip' '!debug')
# https://files.pythonhosted.org/packages/fe/33/0ce2cad39bdcaa8eeda2a7de7ce4613ea6f5c540d5accf0fbe51c9f5253c/curated_tokenizers-2.0.0-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
# source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
source=("https://files.pythonhosted.org/packages/fe/33/0ce2cad39bdcaa8eeda2a7de7ce4613ea6f5c540d5accf0fbe51c9f5253c/$_name-${pkgver}-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
noextract=()
sha256sums=('9b948d299157c317474d7c2c325b073187c6123c5c520b299603548781b8b98a')

package() {
    python -m installer --destdir="${pkgdir}" ${srcdir}/$_name-$pkgver-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
}
