# Maintainer: Stefan Ott <stefan@ott.net>
pkgname=synodl
pkgver=0.4.0
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
sha256sums=("1f8ee55e27d29904bbcc5a164ee7e7e20ce746e2055b13050b2e70139da034a9")
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
