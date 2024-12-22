# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-arm-gdb
_name=arm_gdb
pkgver=0.9.10
pkgrel=2
epoch=
pkgdesc="Python module for an easier access to analyze ARM Cortex-M peripherals"
arch=('any')
url="https://pypi.org/project/arm-gdb"
license=(MIT)
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
depends=(python
)
makedepends=(python-build
    python-installer
    python-wheel
    python-setuptools-git-versioning)
checkdepends=()
options=()
# source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
source=(https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name}-$pkgver-py3-none-any.whl)
noextract=()
sha256sums=('b9f6492f1ac412255f5b4fd0088e3c91ab8fa299789f586ecd50bd7578d26bc6')

# build() {
#     cd "${srcdir}/${_name}-${pkgver}"
#     python -m build --wheel --no-isolation
# }

package() {
    #     cd "${srcdir}/${_name}-${pkgver}"
    #     python -m installer --destdir="${pkgdir}" dist/*.whl
    python -m installer --destdir="$pkgdir" ${srcdir}/${_name}-$pkgver-py3-none-any.whl
}
