# Maintainer: Stefan Ott <stefan@ott.net>
pkgname=synodl
pkgver=0.2.1
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
source=("synodl-${pkgver}.tar.gz::https://code.ott.net/synodl/downloads/synodl-0.2.1.tar.gz")
sha256sums=("263bbfc4098a2da5a6be066463aca7f253e448208621a166aecf64807e443f2b")
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
