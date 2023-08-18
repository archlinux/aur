# Maintainer: raf <raf at raf dot org>
pkgname=sshdo
pkgver=1.1.1
pkgrel=1
pkgdesc="Controls which commands may be executed via incoming ssh"
arch=("any")
url=https://raf.org/sshdo/
license=("GPL")
depends=("python>=2.6")
checkdepends=("python>=2.6")
backup=("etc/sshdoers" "etc/sshdo.banner" "etc/sshdoers.d")
source=("https://raf.org/sshdo/download/$pkgname-$pkgver.tar.gz")
sha256sums=("9b22e14fec786b692e8d6431a81e9b17ad8f6e62ae5d6ef9e9c643690bf33f90")

build()
{
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --destdir="$pkgdir"
}

check()
{
	cd "$pkgname-$pkgver"
	make test
}

package()
{
	cd "$pkgname-$pkgver"
	mkdir -p -m 755 "$pkgdir/etc" "$pkgdir/usr/bin" "$pkgdir/usr/share/man" # <= sshdo-1.1.1
	make install
}

