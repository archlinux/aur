# Maintainer: Techcable <Techcable at techcable dot net>
pkgname=python-term-background
pkgver=1.0.2
pkgrel=1
epoch=
pkgdesc="Python module to align a simple (not nested) list in columns."
arch=("any")
_reponame="shell-term-background" # Why is it called 'shell' instead of 'python'?
url="https://github.com/rocky/shell-term-background"
license=("GPLv2")
groups=()
depends=()
makedepends=("python-setuptools")
checkdepends=("python-pytest")
backup=() # Anything we need to backup?
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('729ccb45be09afdf395c86a3f565424c3480ba743e37a255d6e06419ce61b846')

prepare() {
    true; # Nothing to do I guess
}

build() {
    cd "${_reponame}-$pkgver"
    python3 ./setup.py build;
}

check() {
    cd "${_reponame}-$pkgver"
    PYTHONPATH="." pytest test; 
}

package() {
    cd "${_reponame}-$pkgver"
    python setup.py install --root="$pkgdir/" --prefix="/usr"
}
