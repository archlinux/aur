# Maintainer: Adrià Cereto i Massagué <ssorgatem at gmail.com>

pkgname=dxvk-bin
pkgver=0.54
pkgrel=1
pkgdesc="A Vulkan-based compatibility layer for Direct3D 11 which allows running 3D applications on Linux using Wine (binary files)"
arch=('x86_64')
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
depends=('vulkan-icd-loader' 'wine>=3.5')
provides=("dxvk")
conflicts=("dxvk-git")
source=("https://github.com/doitsujin/dxvk/releases/download/v$pkgver/dxvk-$pkgver.tar.gz")
sha256sums=("1c2f186baaa01d2de7b832f6f05021bdd29eccb65fc197c8b15adfd4e08f9640")

package() {
	mkdir -p $pkgdir/usr/share/dxvk
	tar -xf dxvk-"$pkgver".tar.gz -C "$pkgdir/usr/share/dxvk" --strip-components=1
	mkdir -p $pkgdir/usr/bin
	ln -s "/usr/share/dxvk/x64/setup_dxvk.sh" "$pkgdir/usr/bin/setup_dxvk64"
	ln -s "/usr/share/dxvk/x32/setup_dxvk.sh" "$pkgdir/usr/bin/setup_dxvk32"
}
