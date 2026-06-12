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
sha256sums=('e96194a736ab2ebb1a923813dbf764a8fa4ed8d4e1b48bfdc63736117f7d46fa')

build() {
    cmake -B build -S "$pkgname-$pkgver" -G Ninja
    cmake --build build --config Release
}

package() {
    DESTDIR="$pkgdir" cmake --install build --config Release
}