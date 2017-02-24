# Contributor: moparisthebest <admin dot archlinux AT moparisthebest dot com>

pkgname=pkgsync
pkgver=1.01
pkgrel=1
pkgdesc='Sync installed packages across Arch installs'
arch=('any')
license=('GPL3')
author='moparisthebest'
url="https://github.com/$author/$pkgname"
backup=("etc/$pkgname/pkg_blacklist.list" "etc/$pkgname/pkg_exclude.list" "etc/default/$pkgname")
source=("https://github.com/$author/$pkgname/archive/v$pkgver.tar.gz" "https://github.com/$author/$pkgname/releases/download/v$pkgver/v$pkgver.tar.gz.asc")
sha256sums=('0d04af19ed5ffad2814b2845849a46ce2d606b4ef8e93e0dffb3b0f0ed8e760d'
            'SKIP')
validpgpkeys=('81F1C22DD41109D4A9C0A7B5B070F8D97D1A0BBA') # moparisthebest <admin AT moparisthebest.com>

package() {
	install -d "${pkgdir}"/etc/{default,$pkgname}/

	cd "$pkgname-$pkgver"

	install -Dm744 $pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm744 config/*.list "${pkgdir}/etc/$pkgname/"
	install -Dm744 "config/$pkgname" "${pkgdir}/etc/default/"
}
