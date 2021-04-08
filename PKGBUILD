# Maintainer: Lukas Werling <lukas@lwrl.de>
pkgname=sonobus
pkgver=1.4.3
pkgrel=1
pkgdesc="An easy to use application for streaming high-quality, low-latency peer-to-peer audio"
arch=('i686' 'x86_64')
url="https://sonobus.net"
license=('GPL3')
depends=('opus' 'curl' 'freetype2' 'libxrandr' 'libxinerama' 'libxcursor' 'libgl' 'libasound.so=2-64' 'libjack.so=0-64')
makedepends=()
source=("https://github.com/essej/sonobus/archive/${pkgver}.tar.gz")
sha256sums=('b4ad0aaee19d9dd73b6da097007810a429029052c926cf08d2d6a8a37714c4a1')

build() {
	cd "sonobus-${pkgver}/Builds/LinuxMakefile"
	./build.sh
}

package() {
	cd "sonobus-${pkgver}/Builds/LinuxMakefile"
	./install.sh "$pkgdir/usr"
}
