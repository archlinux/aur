# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>

pkgname=docker-machine
pkgver=0.3.1
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

sha256sums=('bc33a3a930cf570b57193649b42f22c9d8f2c97cb7ed8462235f21d82a9ac024')
[[ $CARCH = i686 ]] && sha256sums[0]='521bd92e069f35aac5a0804edc986fe4cc26e59a690570aa29b4ca38290a0f5f'

package() {
    install -Dm755 docker-machine "${pkgdir}/usr/bin/docker-machine"
}
