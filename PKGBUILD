# Maintainer: Zack Didcott

pkgname=snakedream-git
pkgver=1.2.2
pkgrel=1
pkgdesc="Python interface for a Daydream controller."
arch=("any")
url="https://github.com/Zedeldi/snakedream"
license=("MIT")
depends=("python" "python-bleak" "python-matplotlib" "python-uinput" "python-pyautogui")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
provides=("snakedream")
conflicts=("snakedream")
source=("${pkgname}::git+https://github.com/Zedeldi/snakedream.git")
b2sums=("SKIP")

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
