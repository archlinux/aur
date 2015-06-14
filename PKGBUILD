# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>
 
pkgname=docker-machine
pkgver=0.3.0_rc2
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

sha256sums=('4804dfb905671e97846d4ec1ac25723de6f3566e2b94d9e0adad89047d9d4b58')
[[ $CARCH = i686 ]] && sha256sums[0]='efdfd069747752757a81259f363960c50657a58de8b979f9b14e808a521d267a'

package() {
    install -Dm755 docker-machine "${pkgdir}/usr/bin/docker-machine"
}
