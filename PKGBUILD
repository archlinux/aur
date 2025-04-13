# Maintainer: Niels Huylebroeck <arch@nightwalkers.be>
pkgname=sway-input-config
pkgver=1.4.3
pkgrel=2
license=("GPL3")
pkgdesc="Sway Input Configurator"
makedepends=(
  'python-setuptools'
)
depends=(
    "qt6-wayland" "python-pyqt6" "python-i3ipc" "sway"
)

arch=("i686" "x86_64")
url="https://github.com/Sunderland93/sway-input-config"
source=("https://codeload.github.com/Sunderland93/sway-input-config/zip/refs/tags/v$pkgver")
sha256sums=('ccf37846d6b82af682ffb3f36cc41799b47481f0a2c549c120f36a9b84497b73')
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
