# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>

pkgname=docker-machine-bin
pkgver=0.5.6
pkgrel=1
pkgdesc='Machine management for a container-centric world'
arch=('x86_64')
url='https://github.com/docker/machine'
install="docker-machine.install"
license=('Apache')
depends=()
provides=('docker-machine')
conflicts=('docker-machine')

source=(
    "docker-machine::https://github.com/docker/machine/releases/download/v${pkgver//_/-}/docker-machine_linux-amd64"
    "https://raw.githubusercontent.com/docker/machine/master/LICENSE"
)
sha256sums=(
    'ebaf9fc4bdc19e8523905490af422ab4db5dea7bd399c917c7e00851a65d3df5'
    'SKIP'
)

package() {
    install -Dm755 ${srcdir}/docker-machine ${pkgdir}/usr/bin/docker-machine
    install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/docker-machine/LICENSE
}

