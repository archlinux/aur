# Maintainer: Lukas Werling <lukas@lwrl.de>
pkgname=sonobus
pkgver=1.3.2
pkgrel=1
pkgdesc="An easy to use application for streaming high-quality, low-latency peer-to-peer audio"
arch=('i686' 'x86_64')
url="https://sonobus.net"
license=('GPL3')
depends=('opus' 'curl' 'freetype2' 'libxrandr' 'libxinerama' 'libxcursor' 'libgl' 'libasound.so=2-64' 'libjack.so=0-64')
makedepends=()
source=("https://github.com/essej/sonobus/archive/${pkgver}.tar.gz")
sha256sums=('298e073d2369530a130efe17292dec2ab3990bfd0b72b1532c8f9fedea623435')

build() {
	cd "sonobus-${pkgver}/Builds/LinuxMakefile"
	./build.sh
}

package() {
	cd "sonobus-${pkgver}/Builds/LinuxMakefile"
	./install.sh "$pkgdir/usr"
}
