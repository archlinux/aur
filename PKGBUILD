# Maintainer: Nathan Ollerenshaw <chrome@stupendous.net>

pkgname=smoothpaper
pkgdesc="A wallpaper daemon for Wayland Compositors and X11 Window Mangers using OpenGL for smooth fading."
pkgver=2.4.1
pkgrel=1
url=https://github.com/matjam/smoothpaper
arch=(x86_64)
depends=('mesa' 'glad' 'libdrm' 'libglvnd' 'libva' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxext' 'libxfixes' 'libxrender' 'wayland')
makedepends=('go' 'base-devel' 'zip' 'unzip')

source=(https://github.com/matjam/smoothpaper/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('4c455882f1aef3ddf3b4b736ad27cc0f9d6d410ca7b49db5164afd2e368de47b')

build() {
cd $pkgname-$pkgver
go build -o smoothpaper ./cmd/smoothpaper 
}

package() {
mkdir -p $pkgdir/usr/bin
cp $pkgname-$pkgver/smoothpaper $pkgdir/usr/bin
mkdir -p $pkgdir/etc/xdg/smoothpaper
cp $pkgname-$pkgver/smoothpaper.toml $pkgdir/etc/xdg/smoothpaper
}
