# Maintainer: Niels Huylebroeck <arch@nightwalkers.be>
pkgname=sway-input-config
pkgver=1.4.2
pkgrel=1
license=("GPL3")
pkgdesc="Sway Input Configurator"
makedepends=(
  'python-setuptools'
)
depends=(
    "python-pyqt6" "python-i3ipc" "sway"
)

arch=("i686" "x86_64")
url="https://github.com/Sunderland93/sway-input-config"
source=("https://codeload.github.com/Sunderland93/sway-input-config/zip/refs/tags/v$pkgver")
sha256sums=('9c67e1bfbbd930ce3cac043a672d4df83e3b22e2d1bbcfa0a66edb041fa871bd')
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
