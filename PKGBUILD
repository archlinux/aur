# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: push2001sla@gmail.com
# Developer: andrewcrew@rambler.ru

pkgname=gxneur-devel-git
pkgver=0.20.0
pkgrel=17
epoch=
pkgdesc="XNeur GTK frontend. Git version"
arch=('any')
url="https://github.com/AndrewCrewKuznetsov/xneur-devel"
license=('GPL')
groups=()
depends=('libglade' "xneur-devel-git>=$pkgver" 'gconf' 'xorg-xprop')
makedepends=('git')
checkdepends=()
optdepends=()
provides=("gxneur=$pkgver")
conflicts=('gxneur')
replaces=('gxneur')
backup=()
options=()
install=
changelog=
source=("git+http://github.com/AndrewCrewKuznetsov/xneur-devel.git")
noextract=()
md5sums=('SKIP')

validpgpkeys=()

#prepare() {
#	#rm -rf "$pkgname-$pkgver"
	#git clone https://github.com/AndrewCrewKuznetsov/xneur-devel "$pkgname-$pkgver" || echo
#}

build() {
	cd "$srcdir/xneur-devel/gxneur"
	# If you have xosd, why dont use it?
    touch README
    ./autogen.sh --prefix=/usr
    sed -i 's/TODO//' Makefile
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"	

	cd "$srcdir/xneur-devel/gxneur"
	make DESTDIR="$pkgdir/" install
	
}

