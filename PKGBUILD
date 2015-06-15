# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>
 
pkgname=docker-machine
pkgver=0.3.0_rc3
pkgrel=1
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

sha256sums=('e659304032dc2df166a377881df64783785ee473e2af7506eb08b7855e70974b')
[[ $CARCH = i686 ]] && sha256sums[0]='355a238ec0c7f05085234d7532e52fd1d3cf755e26e9068d227d29364d81c583'

package() {
    install -Dm755 docker-machine "${pkgdir}/usr/bin/docker-machine"
}
