# Maintainer: Yassine Oudjana <y.oudjana@protonmail.com>

pkgname=derelict-vulkan
pkgver=0.0.20
pkgrel=1
pkgdesc="A dynamic binding to the vulkan api."
arch=('x86_64')
url="https://github.com/Zoadian/DerelictVulkan"
license=('Boost')
makedepends=('dub')
source=("https://github.com/Zoadian/DerelictVulkan/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('018f0ed1daa49137bd5d613c5be8919201227aeecf20d11300fbb4f8622a80a5')

build() {
	cd DerelictVulkan-$pkgver

	dub build
}

package() {
	cd DerelictVulkan-$pkgver

	install -Dm0755 -t "$pkgdir/usr/lib/" "bin/libderelict-vulkan.a"
	mkdir -p "$pkgdir/usr/include/d/derelict/vulkan"
	cp -R --no-dereference --preserve=mode,links "source/derelict/vulkan" "$pkgdir/usr/include/d/derelict/"
}

