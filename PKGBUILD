# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=mscompress
pkgver=0.3
pkgrel=2
pkgdesc='Microsoft "compress.exe/expand.exe" compatible (de)compressor'
arch=("i686" "x86_64")
url="http://martin.hinner.info/mscompress/"
license=("GPL2")
#source=("ftp://ftp.penguin.cz/pub/users/mhi/mscompress/$pkgname-$pkgver.tar.bz2")
source=("https://mirrors.kernel.org/gentoo/distfiles/$pkgname-$pkgver.tar.bz2")
sha1sums=('76fd76b08ca62b20cf4aacef78e5030a4b08c285')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	for _app in mscompress msexpand; do
		install -Dm 0755 "$_app" "$pkgdir/usr/bin/$_app-mh"
		install -Dm 0644 "$_app.1" "$pkgdir/usr/share/man/man1/$_app-mh.1"
	done
}

# vim: set ft=sh
