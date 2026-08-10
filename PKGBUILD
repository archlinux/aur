# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=speedata-publisher
pkgname=$_pkgname-bin
pkgver=5.7.9
pkgrel=1
pkgdesc='a publishing tool that automates creation of high-quality layouted PDFs from databases'
arch=(x86_64)
url='https://www.speedata.de/en/product'
license=(AGPL-3.0-only)
depends=(glibc)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!debug)
source=("https://download.speedata.de/dl/$_pkgname-linux-amd64-$pkgver.zip")
sha256sums=('68a657d4989b5101ebe0d9f45590134a557a37f91c5ec7c5935cbba20126039d')

prepare() {
	cd "$_pkgname"
	rm installation.txt
}

package() {
	ls -al
	local target="$pkgdir/opt"
	mkdir -p "$target" "$pkgdir/usr/bin"
	cp -a "$_pkgname" "$target/"
	ln -sf "/opt/$_pkgname/bin/sp" "$pkgdir/usr/bin/"
}
