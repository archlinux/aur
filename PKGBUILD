# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=(otf-commissioner ttf-commissioner ttf-commissioner-variable)
_reponame=Commissioner
pkgbase=commissioner-font
pkgver=1.000
_commit=6f5f608854584c65e519d92292fb01cb9937f656
pkgrel=3
pkgdesc='Sans typeface by Kostas Bartsokas'
arch=(any)
url="https://github.com/kosbarts/$_reponame"
license=(OFL)
source=("$url/archive/$_commit/$pkgbase-$pkgver-$pkgrel.zip")
sha512sums=('5b022f528b53af63d364125defa4b77208707c9f5aea6709d256dd87960eba54feacbd2a61e6e0746770ff4118f1a1dff458d2111ed9163feda18cf1b761b564')

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
