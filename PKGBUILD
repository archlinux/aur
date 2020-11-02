# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-rlgear-git
pkgver=r25.957ebb7
pkgrel=1
pkgdesc="Makes setting up RL projects with Rllib a bit more turn-key"
arch=('any')
url='https://github.com/esquires/rlgear'
license=('BSD-3-Clause')
depends=('python' 'python-git-python' 'python-tabulate' 'python-pandas'
    'python-matplotlib' 'python-gym' 'python-dataclasses' 'python-ray'
    'python-crc32c' 'python-requests' 'python-dm-tree' 'python-lz4')
makedepends=('python' 'python-setuptools')
_pkgname=rlgear
source=("${_pkgname}::git+https://github.com/esquires/rlgear")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="$pkgdir"/ --optimize=1
}
