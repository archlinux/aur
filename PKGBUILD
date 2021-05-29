# Maintainer: Grant Moyer <grantmoyer@gmail.com>
pkgname=foundryvtt
pkgver=0.7.10
pkgrel=1
pkgdesc="A self-hosted, modern, and developer-friendly roleplaying platform"
arch=('x86_64')
url="https://foundryvtt.com/"
license=('custom')
# FoundryVTT archive must be downloaded from https://foundryvtt.com/community/<usename>/licenses
source=("foundryvtt-$pkgver.zip::local://foundryvtt-$pkgver.zip")
sha256sums=('e756b4758a93d605ae790bdb3f99313f2b1610d8b832493b565f7f7e11643f57')

package() {
	install -m755 -d "$pkgdir/opt/$pkgname"
	install -m755 -d "$pkgdir/usr/bin"
	cp -r * "$pkgdir/opt/$pkgname"
	rm "$pkgdir/opt/$pkgname/${source[0]}"
	ln -s "$pkgdir/opt/$pkgname/foundryvtt" "$pkgdir/usr/bin/foundryvtt"
}
