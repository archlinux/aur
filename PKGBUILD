# Maintainer: Berny23 <webmaster@berny23.de>
pkgname=virtual-surround-manager
pkgver=1.3.0
pkgrel=1
pkgdesc="3D sound for headphones"
arch=('x86_64')
url="https://github.com/Berny23/virtual-surround-manager"
license=('MIT')
depends=('pipewire')
makedepends=('git'
    'ninja'
    'libpipewire'
    'base-devel'
    'extra-cmake-modules'
    'cmake'
    'kirigami'
    'ki18n'
    'kcoreaddons'
    'breeze'
    'kiconthemes'
    'qt6-base'
    'qt6-declarative'
    'qqc2-desktop-style')
conflicts=("$pkgname")
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a119c2aab6e1db4e3e48a7d34dfaeb2bf13dc673883f871a57c7829fb066d904')

build() {
    cmake -B build -S "$pkgname-$pkgver" -G Ninja
    cmake --build build --config Release
}

package() {
    DESTDIR="$pkgdir" cmake --install build --config Release
}