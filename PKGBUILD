# Maintainer: Grant Moyer <grantmoyer@gmail.com>
pkgname=foundryvtt
pkgver=0.8.8
pkgrel=2
pkgdesc="A self-hosted, modern, and developer-friendly roleplaying platform"
arch=('x86_64')
url="https://foundryvtt.com/"
license=('custom')
# FoundryVTT archive must be downloaded from https://foundryvtt.com/community/<usename>/licenses
source=("foundryvtt-$pkgver.zip::local://foundryvtt-$pkgver.zip")
sha256sums=('bd3958f32374e472857841669bcef4d65c6083eba4224f3fe67c167a067b7bb7')

package() {
	install -m755 -d "$pkgdir/opt/$pkgname"
	install -m755 -d "$pkgdir/usr/bin"
	install -m644 -D -t "$pkgdir/usr/share/licenses/$pkgname/" "resources/app/license.html"
	cp -r * "$pkgdir/opt/$pkgname"
	rm "$pkgdir/opt/$pkgname/${source[0]/::*/}"
	ln -s "/opt/$pkgname/foundryvtt" "$pkgdir/usr/bin/foundryvtt"
}
