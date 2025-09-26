# Maintainer: Nathan Ollerenshaw <chrome@stupendous.net>

pkgname=smoothpaper
pkgdesc="A wallpaper daemon for Wayland Compositors and X11 Window Mangers using OpenGL for smooth fading."
pkgver=2.5.0
pkgrel=1
url=https://github.com/matjam/smoothpaper
arch=(x86_64)
depends=('mesa' 'glad' 'libdrm' 'libglvnd' 'libva' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxext' 'libxfixes' 'libxrender' 'wayland')
makedepends=('go' 'base-devel' 'zip' 'unzip')

source=(https://github.com/matjam/smoothpaper/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('d736224db8873baa91ee93bdca2c6930d88a3ab9ccf58ae31fa81b2dde736520')

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
