# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>

pkgname=docker-machine-bin
pkgver=0.7.0rc3
_pkgver=0.7.0-rc3
pkgrel=1
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
sha256sums=('6544df7946b6236c0a19f897f08124b342cf28bdac34357ba19626c62f374236'
            'SKIP')

package() {
    install -Dm755 ${srcdir}/docker-machine ${pkgdir}/usr/bin/docker-machine
    install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/docker-machine/LICENSE
}

