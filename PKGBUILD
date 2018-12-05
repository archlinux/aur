# Maintainer: James Groom <OSSYoshiRulz at gmail dot com>
pkgname=libblip_buf
pkgver=1.1.1
pkgrel=1
pkgdesc="A small waveform synthesis library meant for use in emulating sound chips of classic consoles."
arch=('x86_64')
url="https://gitlab.com/TASVideos/libblip_buf"
license=('LGPL2.1')
depends=('glibc')
source=('https://gitlab.com/TASVideos/libblip_buf/-/archive/1.1.1/libblip_buf-1.1.1.tar.gz')
sha512sums=('228199524521a27e29ebede20a0815029b1c60d79786ce98b7596629e3853d70f7e2f880aba142fd5d221670ab3e95db27289412546d7d339b5039a899d7ba76')

build() {
	cd "$pkgname-$pkgver"
	make so
}

package() {
	install -Dm755 "$pkgname-$pkgver/libblip_buf.so.$pkgver" "$pkgdir/usr/lib/libblip_buf.so.$pkgver"
	cd "$pkgdir/usr/lib"
	ln -fs "$pkgname.so.$pkgver" "$pkgname.so"
	ln -fs "$pkgname.so.${pkgver%%.*}" "$pkgname.so"
}
