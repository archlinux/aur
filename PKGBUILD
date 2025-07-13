# Maintainer: Nikolas Koesling <nikolas@koesling.info>

pkgname=shm-modbus-gui
pkgver=2.2.0
pkgrel=1
pkgdesc="QT GUI (PySide6) for shm-modbus"
url="https://github.com/SHMModbus/shm_modbus_gui"
license=('GPLv3')
arch=('any')
makedepends=('python-setuptools')
depends=('python' 'pyside6' 'modbus-rtu-client-shm' 'modbus-tcp-client-shm' 
         'dump-shm' 'write-shm' 'shared-mem-random' 'shm-format' 'stdin-to-modbus-shm')
source=("git+https://github.com/SHMModbus/shm_modbus_gui.git#tag=v${pkgver}")

sha256sums=('SKIP')

build() {
    cd shm_modbus_gui
    python setup.py build
}

package() {
    cd shm_modbus_gui
    python setup.py install --root="$pkgdir" --optimize=1
}
