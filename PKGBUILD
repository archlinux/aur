# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>

pkgname=docker-machine
pkgver=0.5.3
pkgrel=1
epoch=2
pkgdesc='Machine management for a container-centric world'
arch=('i686' 'x86_64')
url='https://github.com/docker/machine'
install="docker-machine.install"
license=('Apache')
depends=()
provides=('docker-machine')
conflicts=('docker-machine-bin')

source=('https://raw.githubusercontent.com/docker/machine/master/LICENSE')
sha256sums=('SKIP')

source_x86_64=("docker-machine::https://github.com/docker/machine/releases/download/v${pkgver//_/-}/docker-machine_linux-amd64")
source_i686=("docker-machine::https://github.com/docker/machine/releases/download/v${pkgver//_/-}/docker-machine_linux-386")

sha256sums_x86_64=('909cae9be74b39cc529fc015aa7c015e1d8f96322d7d92a64004957054965a81')
sha256sums_i686=('71cacb6afe654dd6ad2715fc4c59656c4c0868b6235563315cc629abcf8ee452')

package() {
    install -Dm755 ${srcdir}/docker-machine ${pkgdir}/usr/bin/docker-machine
    install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/docker-machine/LICENSE
}

