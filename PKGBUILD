# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>

pkgname=docker-machine-bin
pkgver=0.6.0rc3
_pkgver=0.6.0-rc3
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
    "docker-machine::https://github.com/docker/machine/releases/download/v${_pkgver}/docker-machine-linux-x86_64"
    "https://raw.githubusercontent.com/docker/machine/master/LICENSE"
)
sha256sums=(
    '467e71cf8bf8dc8f7dec17964a252fc79a4dca8de8bbd4018df6a46067a99a69'
    'SKIP'
)

package() {
    install -Dm755 ${srcdir}/docker-machine ${pkgdir}/usr/bin/docker-machine
    install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/docker-machine/LICENSE
}

