# Maintainer: Nikolas Koesling <nikolas@koesling.info>

pkgname=shm-modbus-gui
pkgver=1.0.0
pkgrel=1
pkgdesc="QT GUI (PySide6) for shm-modbus"
url="https://github.com/NikolasK-source/shm_modbus_gui"
license=('GPLv3')
arch=('any')
depends=('python' 'pyside6' 'modbus-rtu-client-shm' 'modbus-tcp-client-shm' 
         'dump-shm' 'write-shm' 'shared-mem-random')
source=("git+https://github.com/NikolasK-source/shm_modbus_gui.git#tag=v${pkgver}")

sha256sums=('SKIP')

package() {
    cd shm_modbus_gui
    mkdir -p "${pkgdir}/usr/share/shm-modbus-gui/py_ui"
    install -Dm555 src/*.py "${pkgdir}/usr/share/shm-modbus-gui"
    chmod +x "${pkgdir}/usr/share/shm-modbus-gui/main.py"
    install -Dm555 src/py_ui/*.py "${pkgdir}/usr/share/shm-modbus-gui/py_ui"

    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    ln -s ../share/shm-modbus-gui/main.py shm-modbus-gui
}
