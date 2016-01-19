# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>

pkgname=docker-machine-bin
pkgver=0.6.0rc1
_pkgver=0.6.0-rc1
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
    "docker-machine::https://github.com/docker/machine/releases/download/v${_pkgver}/docker-machine_linux-amd64"
    "https://raw.githubusercontent.com/docker/machine/master/LICENSE"
)
sha256sums=(
    'ea4213e06a6acca56934cde8e9878af9f9cc25c31b51935cbae57b7029aa6b96'
    'SKIP'
)

package() {
    install -Dm755 ${srcdir}/docker-machine ${pkgdir}/usr/bin/docker-machine
    install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/docker-machine/LICENSE
}

