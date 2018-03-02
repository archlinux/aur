# Maintainer: Adrià Cereto i Massagué <ssorgatem at gmail.com>

pkgname=dxvk-bin
pkgver=0.30
pkgrel=1
epoch=
pkgdesc="A Vulkan-based compatibility layer for Direct3D 11 which allows running 3D applications on Linux using Wine (binary files). Requires Wine with Vulkan support (wine-staging, wine-vulkan or wine >=3.3)"
arch=('x86_64')
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
groups=()
depends=('vulkan-icd-loader' 'wine')
checkdepends=()
provides=("dxvk")
conflicts=("dxvk-git")
replaces=()
backup=()
install=
changelog=
source=("https://github.com/doitsujin/dxvk/releases/download/v0.30/dxvk-0.30.tar.gz")
noextract=()
sha256sums=("797e997a992c3e3f1d4f0399a66fa8f4afef27f9d7913ea3acdc2fcf8c3be544")
validpgpkeys=()


build() {
	tar xvf dxvk-0.30.tar.gz
}



package() {
        mkdir -p $pkgdir/opt/dxvk
	cp -r "dxvk-$pkgver"/x64  $pkgdir/opt/dxvk
	cp -r "dxvk-$pkgver"/x64  $pkgdir/opt/dxvk
	mkdir -p $pkgdir/usr/local/bin
	ln -s "/opt/dxvk/x64/setup_dxvk.sh" "$pkgdir/usr/local/bin/setup_dxvk64"
        ln -s "/opt/dxvk/x32/setup_dxvk.sh" "$pkgdir/usr/local/bin/setup_dxvk32"
}
