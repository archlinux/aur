# Maintainer: Nathan Ollerenshaw <chrome@stupendous.net>

pkgname=smoothpaper
pkgdesc="A wallpaper changer daemon for X11 Window Mangers with smooth transitions between wallpapers."
pkgver=2.0.0
pkgrel=1
url=https://github.com/matjam/smoothpaper
arch=(x86_64)
depends=('mesa' 'glad' 'libxrender' 'libva')
makedepends=('go' 'base-devel' 'zip' 'unzip')

source=(https://github.com/matjam/smoothpaper/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('eab91f28f3e519987b17898c429e38d8a45bd70f28e477605574d52d382c6aef')

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
