# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=(otf-commissioner ttf-commissioner ttf-commissioner-variable)
_reponame=Commissioner
pkgbase=commissioner-font
pkgver=1.000
_commit=42b2d8fa94eef84e392e1746c5dc5aaea75fe120
pkgrel=1
pkgdesc='Sans typeface by Kostas Bartsokas'
arch=(any)
url="https://github.com/kosbarts/$_reponame"
license=(custom:OFL)
depends=(fontconfig xorg-font-utils)
source=("$url/archive/$_commit/$pkgbase-$pkgver.zip")
sha512sums=('5e3c11c1603b44e77973744746de9c79d579d191c15b9f28fc0e1ba80ddb4748fe2ded53a3206bb7d21ca68fe747d98321a16a8c4de0672c6863c41a6d9effbf')

package_otf-commissioner() {
	pkgdesc+=' (54 static cuts)'
	conflicts=(ttf-commissioner)
	cd "$_reponame-$_commit"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/commissioner" fonts/static/otfs/*.otf
}

package_ttf-commissioner() {
	pkgdesc+=' (54 static cuts)'
	conflicts=(otf-commissioner)
	cd "$_reponame-$_commit"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/commissioner" fonts/static/ttfs/*.ttf
}

package_ttf-commissioner-variable() {
	pkgdesc+=' (variable version)'
	cd "$_reponame-$_commit"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/commissioner" fonts/variable/*.ttf
}
