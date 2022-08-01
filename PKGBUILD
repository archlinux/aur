# Maintainer: Techcable <Techcable at techcable dot net>
pkgname=python-term-background
pkgver=1.0.1
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
sha256sums=('c59081defac311e078657b0e7e933970a57fc89a4ba152d159436ccc3b6477a8')

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
