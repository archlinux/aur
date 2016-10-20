# Maintainer: Viliam Ganz <viliam.ganz@gmail.com>
_pkgname=nvidia-xrun
pkgname=$_pkgname"-git"
pkgver=0.2.2.gbf1eeab
pkgrel=1
epoch=
pkgdesc="Script to run dedicated X server with discrete nvidia graphics"
arch=("x86_64")
url="https://github.com/Witko/nvidia-xrun"
license=('GPL')
groups=()
depends=('xorg-server' 'xorg-xinit' 'xorg-xrandr' 'nvidia' 'mesa-libgl' 'bbswitch')
makedepends=('git')
checkdepends=()
optdepends=()
provides=("$_pkgname=$pkgver" "$pkgname=$pkgver")
conflicts=("$pkgname")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/Witko/$_pkgname.git")
noextract=()
md5sums=()
validpgpkeys=()

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --tags | sed "s/-/./g"
}

package() {
	cd "$_pkgname"
	install -Dm 644 nvidia-xorg.conf "$pkgdir/etc/X11/nvidia-xorg.conf"
	install -Dm 644 nvidia-xinitrc "$pkgdir/etc/X11/xinit/nvidia-xinitrc"
	install -Dm 755 nvidia-xrun "$pkgdir/usr/bin/nvidia-xrun"
}
md5sums=('SKIP')
