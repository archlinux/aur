# Maintainer: Adrià Cereto i Massagué <ssorgatem at gmail.com>

pkgname=dxvk-bin
pkgver=0.31
pkgrel=1
epoch=
pkgdesc="A Vulkan-based compatibility layer for Direct3D 11 which allows running 3D applications on Linux using Wine (binary files). Requires Wine with Vulkan support (wine-staging, wine-vulkan or wine >=3.3)"
arch=('x86_64')
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
groups=()
depends=('vulkan-icd-loader' 'wine')
#makedpends=('libarchive')
checkdepends=()
provides=("dxvk")
conflicts=("dxvk-git")
replaces=()
backup=()
install=
changelog=
source=("https://github.com/doitsujin/dxvk/releases/download/v$pkgver/dxvk-$pkgver.tar.gz")
noextract=()
sha256sums=("72b7a1b86726be708664c68021e8c11d2bc0362d71e4cd81d9bab528b807fe4a")
validpgpkeys=()


build() {
	tar xvf dxvk-$pkgver.tar.gz
}



package() {
	mkdir -p $pkgdir/usr/share/dxvk
	cp -r "dxvk-$pkgver"/x64  $pkgdir/usr/share/dxvk
	cp -r "dxvk-$pkgver"/x32  $pkgdir/usr/share/dxvk
	mkdir -p $pkgdir/usr/bin
	ln -s "/usr/share/dxvk/x64/setup_dxvk.sh" "$pkgdir/usr/bin/setup_dxvk64"
	ln -s "/usr/share/dxvk/x32/setup_dxvk.sh" "$pkgdir/usr/bin/setup_dxvk32"
}
