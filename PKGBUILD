# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=speedata-publisher
pkgname=$_pkgname-bin
pkgver=5.1.18
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
sha256sums=('eb4864fb1661bb08f16efc3d8c8dcef620fb5086ec45322f334f9638319bd809')

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
