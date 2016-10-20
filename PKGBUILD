# Maintainer: Viliam Ganz <viliam.ganz@gmail.com>
pkgname=nvidia-xrun
pkgver=0.3
pkgrel=0
epoch=
pkgdesc="Script to run dedicated X server with discrete nvidia graphics"
arch=("x86_64")
url="https://github.com/Witko/nvidia-xrun"
license=('GPL')
groups=()
depends=('xorg-server' 'xorg-xinit' 'xorg-xrandr' 'nvidia' 'mesa-libgl' 'bbswitch')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/Witko/nvidia-xrun/archive/$pkgver.tar.gz")
noextract=()
md5sums=('3c906cf87c4040e4cfa433bdd515beb7')
validpgpkeys=()

package() {
	cd "$pkgname-$pkgver"
	install -Dm 644 nvidia-xorg.conf "$pkgdir/etc/X11/nvidia-xorg.conf"
	install -Dm 644 nvidia-xinitrc "$pkgdir/etc/X11/xinit/nvidia-xinitrc"
	install -Dm 755 nvidia-xrun "$pkgdir/usr/bin/nvidia-xrun"
	install -dm 555 "$pkgdir/etc/X11/xinit/nvidia-xinitrc.d"
	install -dm 555 "$pkgdir/etc/X11/nvidia-xorg.conf.d"
}
