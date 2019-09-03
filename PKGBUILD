# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=python-fanshim
_name=${pkgname#python-}
pkgver=0.0.2
pkgrel=1
pkgdesc="Python library for the Pimoroni Fan Shim for Raspberry Pi."
arch=('any')
url="https://github.com/pimoroni/fanshim-python"
license=('MIT')
depends=('python'
         'python-psutil'
         'python-plasmalights'
         'python-rpi.gpio')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

sha512sums=('bcf7f07eb9cdd0c76b5d2dba3d410b8ee5912d3373966a8d54c0a241c2cd1170d21d8cdb227a5dc593c094ea8f88d74cd4d4491bab03b080d306c64b241ac1fa')

package() {
  cd fanshim-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}
