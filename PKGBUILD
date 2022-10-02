# Maintainer: Nikolas Koesling <nikolas@koesling.network>

pkgname=shm-modbus
pkgrel=1
pkgver=1.0.2
pkgdesc="A collection of applications to simulate a shared memory based Modbus client"
url="https://github.com/NikolasK-source/SHM_Modbus"
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('dump-shm' 'modbus-rtu-client-shm' 'modbus-tcp-client-shm' 'shared-mem-random' 'stdin-to-modbus-shm' 'write-shm')
source=("git+https://github.com/NikolasK-source/SHM_Modbus.git#tag=v${pkgver}"
        "https://gist.githubusercontent.com/NikolasK-source/25f30f740396723501a51a4bc075ced7/raw/bcd66db1a4f65fd3657fa12fffda2ee8b3de19c9/shm-modbus")

sha256sums=('SKIP'
            '02c698aafa50d7774df6650e1f85c888140927556d95078fe512a1361be024de')

package() {
    install -Dm755 shm-modbus "${pkgdir}/usr/bin/shm-modbus"

    cd SHM_Modbus
    install -Dm755 shm-modbus "${pkgdir}/usr/share/shm-modbus/shm-modbus.sh"
    install -Dm644 guided-commands.sh "${pkgdir}/usr/share/shm-modbus/guided-commands.sh"
    install -Dm644 manual-commands.sh "${pkgdir}/usr/share/shm-modbus/manual-commands.sh"
}
