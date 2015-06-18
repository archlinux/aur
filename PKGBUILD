# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>
 
pkgname=docker-machine
pkgver=0.3.0
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

sha256sums=('ed753c2cca60072be7a082bda1531ab64618403d283bd06b09d3fddc2fd55f12')
[[ $CARCH = i686 ]] && sha256sums[0]='5672657778b5f8270e7cc6adb7229cff871d3779bed07ee6c086d15c7c102015'

package() {
    install -Dm755 docker-machine "${pkgdir}/usr/bin/docker-machine"
}
