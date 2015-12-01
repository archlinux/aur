# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>

pkgname=docker-machine
pkgver=0.5.2
pkgrel=1
epoch=2
pkgdesc='Machine management for a container-centric world'
arch=('i686' 'x86_64')
url='https://github.com/docker/machine'
install="docker-machine.install"
license=('Apache')
depends=()
provides=('docker-machine')
conflicts=('docker-machine-bin')

source=('https://raw.githubusercontent.com/docker/machine/master/LICENSE')
sha256sums=('SKIP')

source_x86_64=("https://github.com/docker/machine/releases/download/v${pkgver//_/-}/docker-machine_linux-amd64.zip")
source_i686=("https://github.com/docker/machine/releases/download/v${pkgver//_/-}/docker-machine_linux-386.zip")

sha256sums_x86_64=('62c43ff97420a68b13fc10c4db38dfe2ac79ad07254c16770d32ab342c671cb5')
sha256sums_i686=('1947a4f4127c2a0d58033ae0319bd7f856bb9c249e3fadf57dc337c723e3b8c7')

package() {
    find ${srcdir} -name "*docker-machine*" -executable -type f -exec install -Dm755 {} -t ${pkgdir}/usr/bin \;
}

