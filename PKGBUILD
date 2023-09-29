# Maintainer: Stella <jens300304@gmail.com>
# Maintainer: bemxio <bemxiov@protonmail.com>

pkgname=python-osrparse
_name=${pkgname#python-}

pkgdesc="Parser for .osr (osu! replays) file format"

pkgver=7.0.0
pkgrel=1

arch=(any)

url="https://pypi.org/project/osrparse/"
license=("MIT")

depends=(python)
makedepends=(python-build python-installer python-wheel)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=("51353e97c7e3e45a7bcee6cc4be61860")

build() {
    # move to the source directory
    cd "${srcdir}/${_name}-${pkgver}"

    # build the package
    python -m build --wheel --no-isolation
}

#check() {
#    # move to the source directory
#    cd "${srcdir}/${_name}-${pkgver}"
#
#    # run all tests
#    python -m pytest
#}

package() {
    # move to the source directory
    cd "${srcdir}/${_name}-${pkgver}"

    # package the files
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
