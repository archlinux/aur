# Maintainer: PixlOne <pixlone@pm.me>

pkgname=logiops
_pkgname="logiops"
_gitpkgname="logiops"
pkgver=0.3.2
pkgrel=1
pkgdesc="An unofficial driver for Logitech HID++>2.0 mice and keyboard"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/PixlOne/$_gitpkgname"
license=('GPL3')
depends=('libevdev' 'systemd-libs' 'libconfig' 'libudev.so' 'glib2')
makedepends=('cmake' 'gcc')
conflicts=("${_pkgname-*}")
provides=("${_pkgname-*}")
source=("https://github.com/PixlOne/LogiOps/releases/download/v$pkgver/logiops-v$pkgver.tar.gz")
sha256sums=('f5adc75668104e32e29dce7a1960eb391034eebfd3331dbb68fadb318ea43536')

build() {
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -B build -S "$pkgname-v$pkgver"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
