# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=(otf-commissioner ttf-commissioner ttf-commissioner-variable)
_reponame=Commissioner
pkgbase=commissioner-font
pkgver=1.000
_commit=c043f33482d151f57fbb9eb2c729146139dc5c18
pkgrel=4
pkgdesc='Sans typeface by Kostas Bartsokas'
arch=(any)
url="https://github.com/kosbarts/$_reponame"
license=(OFL)
source=("$url/archive/$_commit/$pkgbase-$pkgver-$pkgrel.zip")
sha512sums=('f9961c5c042d3f261f28101a7cfcfcef9bd759d0bd46860a4201b411943840f5f2ec1feda951d81709c78576a5bdc79572c75dde1f267f8af10f7d0633937736')

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
