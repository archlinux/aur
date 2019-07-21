# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Allenyou <cfan789123@126.com>
pkgname=oi-tools-allenyou
pkgver=1.0.1000r
pkgrel=1
epoch=0
pkgdesc="Tools for OIers by Allenyou."
arch=(any)
url="https://www.allenyou.wang"
license=('GPL3')
groups=()
depends=()
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
source=("https://aurlib.allenyou.wang/$pkgname/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('9f75ec7a09dc3c8ceabeda793aa4f801')
validpgpkeys=()

build() {
	cd "$startdir"/src/"$pkgname-$pkgver"
	# cd src/"$pkgname-$pkgver"
	g++ ConsolePauser.cpp -o ConsolePauser
	g++ pause.cpp -o pause
}

package() {
	# cd "$pkgname-$pkgver"
	# make DESTDIR="$pkgdir/" install
	cd "$startdir"/src/"$pkgname-$pkgver"
	install -D -m=775 ConsolePauser "${pkgdir}/usr/bin/ConsolePauser"
	install -D -m=775 pause "${pkgdir}/usr/bin/pause"
}
