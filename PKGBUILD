# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>

pkgname=docker-machine-bin
pkgver=0.7.0
_pkgver=0.7.0
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
sha256sums=('21e490d5cdfa0d21e543e06b73180614f72e6c18a940f476a64cf084cea23aa5'
            'SKIP')

package() {
    install -Dm755 ${srcdir}/docker-machine ${pkgdir}/usr/bin/docker-machine
    install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/docker-machine/LICENSE
}

