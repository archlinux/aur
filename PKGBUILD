# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-syncthingmanager-git
_name=${pkgname#python-}
pkgdesc="Command line tool for the Syncthing API"
url="https://github.com/classicsc/syncthingmanager"

provides=("python-syncthingmanager")
conflicts=("python-syncthingmanager")

pkgver=0.2.0dev2
pkgrel=3

arch=("any")
license=("MIT")

makedepends=(
    "git"
    "python-setuptools"
)
depends=(
    "python"
    "python-syncthing"
)

source=(
    "${pkgname}::git+https://github.com/classicsc/syncthingmanager.git")
sha256sums=(
    "SKIP"
)

build() {
    cd "${srcdir}"/${pkgname}
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
