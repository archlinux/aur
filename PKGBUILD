# Maintainer: Nathan Ollerenshaw <chrome@stupendous.net>

pkgname=smoothpaper
pkgdesc="A wallpaper changer daemon for X11 Window Mangers with smooth transitions between wallpapers."
pkgver=2.4.0
pkgrel=1
url=https://github.com/matjam/smoothpaper
arch=(x86_64)
depends=('mesa' 'glad' 'libdrm' 'libglvnd' 'libva' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxext' 'libxfixes' 'libxrender' 'wayland')
makedepends=('go' 'base-devel' 'zip' 'unzip')

source=(https://github.com/matjam/smoothpaper/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('75ef9530d4549185424f8aeca27c8e38fd93d5e2c3d994b872c1875e6460de57')

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
