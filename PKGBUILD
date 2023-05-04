# Maintainer: PixlOne <pixlone@pm.me>

pkgname=logiops
_pkgname="logiops"
_gitpkgname="logiops"
pkgver=0.3.1
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
sha256sums=('769123729491ee17b1fa4290b5e7ced2d466f5bd034970731df7975c51044e35')

build() {
    cmake -B build -S "$pkgname-v$pkgver"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
