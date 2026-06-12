# Maintainer: Berny23 <webmaster@berny23.de>
pkgname=virtual-surround-manager
pkgver=1.1.0
pkgrel=1
pkgdesc="Enable virtual 7.1 surround sound for your headphones with just one click"
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
sha256sums=('998370b379e8d4916b16470865dd7c0eb0e084a0307fb105e4b7df280ef4b6e8')

build() {
    cmake -B build -S "$pkgname-$pkgver" -G Ninja
    cmake --build build --config Release
}

package() {
    DESTDIR="$pkgdir" cmake --install build --config Release
}