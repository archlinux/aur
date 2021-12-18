# Maintainer: Grant Moyer <grantmoyer@gmail.com>
pkgname=foundryvtt
pkgver=0.8.9
pkgrel=1
pkgdesc="A self-hosted, modern, and developer-friendly roleplaying platform"
arch=('x86_64')
url="https://foundryvtt.com/"
license=('custom')
# FoundryVTT archive must be downloaded from https://foundryvtt.com/community/<usename>/licenses
source=("FoundryVTT-8.255.zip::local://FoundryVTT-8.255.zip")
sha256sums=('b4648dd27fdeb8fd1eeaff4f805830480aea4627c57a583fdae0561201c733d7')

package() {
	install -m755 -d "$pkgdir/opt/$pkgname"
	install -m755 -d "$pkgdir/usr/bin"
	install -m644 -D -t "$pkgdir/usr/share/licenses/$pkgname/" "resources/app/license.html"
	cp -r * "$pkgdir/opt/$pkgname"
	rm "$pkgdir/opt/$pkgname/${source[0]/::*/}"
	ln -s "/opt/$pkgname/foundryvtt" "$pkgdir/usr/bin/foundryvtt"
}
