# Maintainer: Grant Moyer <grantmoyer@gmail.com>
# Co-Maintainer: Tomas S. <me+aur at wereii.cz>

pkgname=foundryvtt
pkgver=9.269
pkgrel=1
pkgdesc="A self-hosted, modern, and developer-friendly roleplaying platform"
arch=('x86_64')
url="https://foundryvtt.com/"
license=('custom')
# FoundryVTT archive must be downloaded from https://foundryvtt.com/community/<usename>/licenses
source=("FoundryVTT-$pkgver.zip::local://FoundryVTT-$pkgver.zip")
sha256sums=('7bc19741e0d7cf6978f12ef9e21c44c8e5d2de0a1e6ac5ea52b390e0cdd00f9b')

package() {
	install -m755 -d "$pkgdir/opt/$pkgname"
	install -m755 -d "$pkgdir/usr/bin"
	install -m644 -D -t "$pkgdir/usr/share/licenses/$pkgname/" "resources/app/license.html"
	cp -r * "$pkgdir/opt/$pkgname"
	rm "$pkgdir/opt/$pkgname/${source[0]/::*/}"
	ln -s "/opt/$pkgname/foundryvtt" "$pkgdir/usr/bin/foundryvtt"
}
