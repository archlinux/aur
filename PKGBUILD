# Maintainer: Niels Huylebroeck <arch@nightwalkers.be>
pkgname=sway-input-config
pkgver=1.2.0
pkgrel=1
license=("GPL3")
pkgdesc="Sway Input Configurator"
makedepends=(
  'python-setuptools'
)
depends=(
    "qt5-wayland" "pyside2" "python-i3ipc" "sway"
)

arch=("i686" "x86_64")
url="https://github.com/Sunderland93/sway-input-config"
source=("https://github.com/Sunderland93/sway-input-config/archive/refs/tags/v$pkgver.zip")
sha256sums=('db2484089e64ce7628d297f7b20a306b717ef1b70f2403b2397b0e8c8ece306c')
provides=("sway-input-config")
conflicts=("sway-input-config")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --skip-build --optimize 1 --root="${pkgdir}"
}
