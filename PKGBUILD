# Maintainer: Adrià Cereto i Massagué <ssorgatem at gmail.com>

pkgname=dxvk-bin
pkgver=0.52
pkgrel=1
pkgdesc="A Vulkan-based compatibility layer for Direct3D 11 which allows running 3D applications on Linux using Wine (binary files)"
arch=('x86_64')
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
depends=('vulkan-icd-loader' 'wine>=3.5')
provides=("dxvk")
conflicts=("dxvk-git")
source=("https://github.com/doitsujin/dxvk/releases/download/v$pkgver/dxvk-$pkgver.tar.gz")
sha256sums=("ca8bcb97cc5aa8c0edcc4892b8e100b8bfac8653138dec6829c6a8bcc04cc11d")

package() {
	mkdir -p $pkgdir/usr/share/dxvk
	tar -xf dxvk-"$pkgver".tar.gz -C "$pkgdir/usr/share/dxvk" --strip-components=1
	mkdir -p $pkgdir/usr/bin
	ln -s "/usr/share/dxvk/x64/setup_dxvk.sh" "$pkgdir/usr/bin/setup_dxvk64"
	ln -s "/usr/share/dxvk/x32/setup_dxvk.sh" "$pkgdir/usr/bin/setup_dxvk32"
}
