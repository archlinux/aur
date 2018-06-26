# Maintainer: Adrià Cereto i Massagué <ssorgatem at gmail.com>

pkgname=dxvk-bin
pkgver=0.60
pkgrel=3
pkgdesc="A Vulkan-based compatibility layer for Direct3D 11 which allows running 3D applications on Linux using Wine (binary files)"
arch=('x86_64')
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
depends=('vulkan-icd-loader' 'wine>=3.10')
provides=("dxvk")
conflicts=("dxvk-git")
source=("https://github.com/doitsujin/dxvk/releases/download/v$pkgver/dxvk-$pkgver.tar.gz")
sha256sums=("27d6f700241d3ec3b6c002c3d739bb0e3f210ec916ecb5a62d9204e9e50f2c4a")

package() {
	mkdir -p $pkgdir/usr/share/dxvk
	tar -xf dxvk-"$pkgver".tar.gz -C "$pkgdir/usr/share/dxvk" --strip-components=1
	mkdir -p $pkgdir/usr/bin
	ln -s "/usr/share/dxvk/x64/setup_dxvk.sh" "$pkgdir/usr/bin/setup_dxvk64"
	ln -s "/usr/share/dxvk/x32/setup_dxvk.sh" "$pkgdir/usr/bin/setup_dxvk32"
}
