# Maintainer: Stefan Ott <stefan@ott.net>
pkgname=synodl
pkgver=0.3.1
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
sha256sums=("4967b702b476ed22de385592875e8c06d19a8e4f5ada62e5f8d2717d63fd42c9")
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
