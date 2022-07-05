# Maintainer: Dan Johansen <strit at manjaro dot org>

pkgname=gpu-viewer
_pkgname=GPU-Viewer
pkgver=1.42
pkgrel=1
pkgdesc="A frontend to glxinfo and vulkaninfo."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/arunsivaramanneo/GPU-Viewer/"
license=('GPL3')
depends=('gtk3' 'python' 'python-gobject' 'python-click' 'vulkan-tools' 'clinfo' 'mesa-utils' 'vdpauinfo')
makedepends=('meson' 'ninja')
optdepends=('nvidia: Vulkan nvidia driver'
            'mesa'
            'vulkan-radeon: Vulkan AMD drivers'
            'vulkan-intel: Vulkan Intel drivers')
source=("https://github.com/arunsivaramanneo/$_pkgname/archive/v$pkgver.tar.gz")

build() {
	cd "$_pkgname-$pkgver"
	meson -D prefix=/usr _build
}

package() {
	cd "$_pkgname-$pkgver/_build"
	DESTDIR="$pkgdir" ninja install
}

md5sums=('7222db15eb9b3acb3ce3fe0a26e35881')
