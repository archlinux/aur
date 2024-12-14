# Maintainer: Rhys Perry <rhysperry111 AT gmail.com>
pkgname=python-unicornhat
_name=unicornhat
pkgver=2.2.3
pkgrel=2
pkgdesc="Python library for UnicornHAT/pHAT"
arch=('any')
url='https://github.com/pimoroni/unicorn-hat'
license=('MIT')
depends=('python' 'python-rpi-ws281x')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('2375b3efbcfc08c190e1c4a69988170d13ddca22b043870fc637110b295f0ce6')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
