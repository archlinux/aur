# Maintainer: Berny23 <webmaster@berny23.de>
pkgname=virtual-surround-manager
pkgver=1.2.1
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
sha256sums=('a511a26bfe3dbe094e3305a535ec60b9f9057523c893f09d9c1f6780bb9764a8')

build() {
    cmake -B build -S "$pkgname-$pkgver" -G Ninja
    cmake --build build --config Release
}

package() {
    DESTDIR="$pkgdir" cmake --install build --config Release
}