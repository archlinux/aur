# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>

pkgname=docker-machine
pkgver=0.4.0
pkgrel=1
epoch=1
pkgdesc='Machine management for a container-centric world'
arch=('i686' 'x86_64')
url='https://github.com/docker/machine'
install="docker-machine.install"
license=('Apache')
depends=()
provides=('docker-machine')
conflicts=('docker-machine-bin')

_arch=amd64
[[ $CARCH = i686 ]] && _arch=386

source=("docker-machine::https://github.com/docker/machine/releases/download/v${pkgver//_/-}/docker-machine_linux-${_arch}")

sha256sums=('58a665440c210de7e864cdb8ae811d24fd34e6ae43344810bcd351724760a843')
[[ $CARCH = i686 ]] && sha256sums[0]='0d56ccf20e80fce5d3822ef14d4faf64875482ae73cdcfebf9ac6a0f38d2f474'

package() {
    install -Dm755 docker-machine "${pkgdir}/usr/bin/docker-machine"
}
