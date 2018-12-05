# Maintainer: James Groom <OSSYoshiRulz at gmail dot com>
pkgname=libblip_buf
pkgver=1.1.1
pkgrel=2
pkgdesc="A small waveform synthesis library meant for use in emulating sound chips of classic consoles."
arch=("x86_64")
url="https://gitlab.com/TASVideos/libblip_buf"
license=("LGPL2.1")
depends=("glibc")
source=("https://gitlab.com/TASVideos/libblip_buf/-/archive/$pkgver/libblip_buf-$pkgver.tar.gz")
sha512sums=("228199524521a27e29ebede20a0815029b1c60d79786ce98b7596629e3853d70f7e2f880aba142fd5d221670ab3e95db27289412546d7d339b5039a899d7ba76")

build() {
	cd "$pkgname-$pkgver"
	make "so"
}

package() {
	install -Dm755 "$pkgname-$pkgver/$pkgname.so.$pkgver" "$pkgdir/usr/lib/$pkgname.so.$pkgver"
	ln -s "$pkgname.so.$pkgver" "$pkgdir/usr/lib/$pkgname.so.${pkgver%%.*}"
	ln -s "$pkgname.so.${pkgver%%.*}" "$pkgdir/usr/lib/$pkgname.so"
}
