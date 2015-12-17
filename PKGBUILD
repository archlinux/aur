# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>

pkgname=docker-machine
pkgver=0.5.4
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

sha256sums_x86_64=('8b03120266c5c3837425dcf5095048cf5a25163de2d87ed0c8ef4f4aa6e2e85e')
sha256sums_i686=('376ba1da4afa079e3bb1ee2958ed679c0bf65da32c9a8505ae68e89dbe227c56')

package() {
    install -Dm755 ${srcdir}/docker-machine ${pkgdir}/usr/bin/docker-machine
    install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/docker-machine/LICENSE
}

