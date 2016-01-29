# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>

pkgname=docker-machine-bin
pkgver=0.6.0rc2
_pkgver=0.6.0-rc2
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
    "docker-machine::https://github.com/docker/machine/releases/download/v${_pkgver}/docker-machine-linux-x86_64"
    "https://raw.githubusercontent.com/docker/machine/master/LICENSE"
)
sha256sums=(
    'be12dbedb573b5ec25f40a1dc3fa9249306d56c7c0d1c4e42582f41fc2d913c3'
    'SKIP'
)

package() {
    install -Dm755 ${srcdir}/docker-machine ${pkgdir}/usr/bin/docker-machine
    install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/docker-machine/LICENSE
}

