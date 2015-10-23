# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>

pkgname=docker-machine
pkgver=0.5.0_rc3
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

source=('https://raw.githubusercontent.com/docker/machine/master/LICENSE')
sha256sums=('SKIP')

source_x86_64=("https://github.com/docker/machine/releases/download/v${pkgver//_/-}/docker-machine_linux-amd64.zip")
source_i686=("https://github.com/docker/machine/releases/download/v${pkgver//_/-}/docker-machine_linux-386.zip")

sha256sums_x86_64=('77ccd3aaedcf950b91fc4204ea0785524a4f66b36c742eff036f48c30a4109de')
sha256sums_i686=('3464267e09a81ff2da750730b58ba7fa8a6b7456cb4f5d8b975d0cf74c221eea')

package() {
    find ${srcdir} -name "*docker-machine*" -executable -type f -exec install -Dm755 {} -t ${pkgdir}/usr/bin \;
}

