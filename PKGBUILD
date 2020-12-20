# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

_pkgbase=python-qutescript
pkgbase=python-qutescript
pkgname=(python-qutescript-git)
pkgver=r34.5115bc8
pkgrel=1
pkgdesc="Painless userscripts for qutebrowser"
url="https://github.com/hiway/python-qutescript"
arch=(x86_64)
license=(BSD)
makedepends=(git python-setuptools)
source=("git+https://github.com/hiway/python-qutescript.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgbase
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $_pkgbase
    python3 setup.py build
}

package_python-qutescript-git() {
    provides=("python-qutescript=$pkgver")
    conflicts=("python-qutescript")

    cd $_pkgbase
    python3 setup.py install --prefix="/usr/" --root="$pkgdir"
}
