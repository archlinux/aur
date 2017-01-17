# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=light-locker-settings
pkgver=master
pkgrel=1
epoch=
pkgdesc="A simple GUI configuration utility for light-locker"
arch=("x86_64" "x86")
url="https://github.com/Antergos/light-locker-settings"
license=('GPL')
groups=()
depends=("light-locker" "python-psutil" "python")
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
source=("https://github.com/Antergos/light-locker-settings/archive/master.zip")
noextract=()
md5sums=('600dcfb665cb45cee58d793057e68e72')
validpgpkeys=()

#prepare() {
#	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
