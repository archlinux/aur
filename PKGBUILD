# Maintainer: Stefan Ott <stefan@ott.net>
pkgname=synodl
pkgver=0.2.0
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
source=("synodl-${pkgver}.tar.gz::https://code.ott.net/synodl/downloads/synodl-0.2.0.tar.gz")
sha256sums=("0bb5ef8e4baef62774e03103b70e554c0350aeb9838a4dd5dd7dbf6395644c38")
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
