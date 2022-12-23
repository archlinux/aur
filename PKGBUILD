# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg='vsg-dev'
_pkgname=VulkanSceneGraph
pkgname=vulkanscenegraph
pkgver=1.0.2
pkgrel=1
pkgdesc="Vulkan & C++17 based Scene Graph Project"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$_pkgname"
license=('MIT')
makedepends=('cmake' 'vulkan-headers' 'vulkan-icd-loader' 'libxcb')
source=("$url/archive/refs/tags/$_pkgname-$pkgver.tar.gz")
sha256sums=('526acd58d6e3a3bd3c3169996e0616d5c4a01e793dc064e8d20217791743bab5')

build() {
    cmake -B "build-$pkgver" -S "$_pkgname-$_pkgname-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    cmake --build "build-$pkgver"
}

package() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
}
