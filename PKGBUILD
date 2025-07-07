# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=speedata-publisher
pkgname=$_pkgname-bin
pkgver=5.1.13
pkgrel=1
pkgdesc='a database publishing software that creates high-quality layouted PDFs fully automatically'
arch=(x86_64)
url='https://www.speedata.de/en/product'
license=(AGPL-3.0-only)
depends=(glibc)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!debug)
source=("https://download.speedata.de/dl/$_pkgname-linux-amd64-$pkgver.zip")
sha256sums=('a4d55442b3ec0df480fbe81329c451a9ed49979854faef5ba605320dad8d167d')

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
