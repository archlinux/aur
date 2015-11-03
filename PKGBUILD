# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>

pkgname=docker-machine
pkgver=0.5.0
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

source_x86_64=("https://github.com/docker/machine/releases/download/v${pkgver//_/-}/docker-machine_linux-amd64.zip")
source_i686=("https://github.com/docker/machine/releases/download/v${pkgver//_/-}/docker-machine_linux-386.zip")

sha256sums_x86_64=('e33b989421cf432882207dbf4ccb9fb3ca7e45176660d65f7bbd64f82fdf55f2')
sha256sums_i686=('9c0563477ff6fc253973671f53f9da62bf3bf2377091244c75e4174166776d39')

package() {
    find ${srcdir} -name "*docker-machine*" -executable -type f -exec install -Dm755 {} -t ${pkgdir}/usr/bin \;
}

