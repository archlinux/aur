# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>

pkgname=docker-machine
pkgver=0.5.0_rc4
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

sha256sums_x86_64=('df85e2bcbef34b6f5db1be63ae595c7d0d54bf4688dec8e2597c59206f85e483')
sha256sums_i686=('823606b3841e2c436ef1d8d3f906a08e121be406509d9d6e5a49ab0012d19ea2')

package() {
    find ${srcdir} -name "*docker-machine*" -executable -type f -exec install -Dm755 {} -t ${pkgdir}/usr/bin \;
}

