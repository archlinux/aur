# Maintainer: Stefan Ott <stefan@ott.net>
pkgname=synodl
pkgver=0.3.0
pkgrel=1
epoch=
pkgdesc="Command-line client for Synology's DownloadStation"
arch=("x86_64")
url="https://code.ott.net/synodl/"
license=("GPL3")
groups=()
depends=("json-c" "curl" )
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
source=("synodl-${pkgver}.tar.gz::https://code.ott.net/synodl/downloads/synodl-${pkgver}.tar.gz")
sha256sums=("5296f45a1a66a1c922d336c4b32ec8686cd264e5460976aafab69c278f678a9f")
noextract=()
md5sums=()
validpgpkeys=()

build()
{
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package()
{
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
