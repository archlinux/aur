# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>

pkgname=docker-machine-bin
pkgver=0.7.0rc3
_pkgver=0.7.0-rc3
pkgrel=2
pkgdesc='Machine management for a container-centric world'
arch=('x86_64')
url='https://github.com/docker/machine'
install="docker-machine.install"
license=('Apache')
depends=()
provides=('docker-machine')
conflicts=('docker-machine')
optdepends=('net-tools: required for VirtualBox driver')

source=(
    "docker-machine::https://github.com/docker/machine/releases/download/v${_pkgver}/docker-machine-Linux-x86_64"
    "https://raw.githubusercontent.com/docker/machine/master/LICENSE"
)
sha256sums=('ddab3eb52fc692a32d4697b2a082791172f8c5bb21e1d8489bb5d2eb1e42348a'
            'SKIP')

package() {
    install -Dm755 ${srcdir}/docker-machine ${pkgdir}/usr/bin/docker-machine
    install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/docker-machine/LICENSE
}

