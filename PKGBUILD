# Maintainer: Grant Moyer <grantmoyer@gmail.com>
# Co-Maintainer: Tomas S. <me+aur at wereii.cz>

pkgname=foundryvtt
pkgver=10.287
pkgrel=1
pkgdesc="A self-hosted, modern, and developer-friendly roleplaying platform"
arch=('x86_64')
url="https://foundryvtt.com/"
license=('custom')
# FoundryVTT archive must be downloaded from https://foundryvtt.com/community/<usename>/licenses
options=(!strip)
source=("FoundryVTT-$pkgver.zip::local://FoundryVTT-$pkgver.zip")
sha256sums=('288bca4ed97144a00f5b3c7fa50a088fa34c4013e557ac9ae569edd8e24a43c4')

package() {
	install -m755 -d "$pkgdir/opt/$pkgname"
	install -m755 -d "$pkgdir/usr/bin"
	install -m644 -D -t "$pkgdir/usr/share/licenses/$pkgname/" "resources/app/license.html"
	cp -r * "$pkgdir/opt/$pkgname"
	rm "$pkgdir/opt/$pkgname/${source[0]/::*/}"
	ln -s "/opt/$pkgname/foundryvtt" "$pkgdir/usr/bin/foundryvtt"
}
