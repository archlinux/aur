# Maintainer: Olga Smirnova <mistresssilvara@hotmail.com>

pkgname='hunspell-ia'
#pkgbase='hunspell-ia'
#pkgname=('hunspell-ia' 'hyphen-ia')
pkgver=20140530
pkgrel=1
pkgdesc="Interlingua hunspell dictionary"
arch=('any')
url="https://addons.mozilla.org/en-us/firefox/addon/dict-ia"
license=('GPL3')
optdepends=('hunspell: the spell checking libraries and apps')
source=("${pkgname}-${pkgver}.zip::https://addons.mozilla.org/firefox/downloads/file/260974/interlingua_sownik_ortograficzny-2014.05.30-tb+fx.xpi")
md5sums=('b3a9affc95e781443a414ed93ad205ac')
sha1sums=('24b54c9b6b36b96f11828ae386d2b7828fbcb93d')

package() {
	cd "$srcdir/dictionaries"
	install -d -m 755 "$pkgdir/usr/share/hunspell"
	install -m 644 ia.{aff,dic} "$pkgdir/usr/share/hunspell"

	install -d -m 755 "$pkgdir/usr/share/doc/$pkgname"
	cp "README_dict-ia.txt" README
	install -m 644 README "$pkgdir/usr/share/doc/$pkgname"
}

#package_hyphen-ia() {
#	optdepends=('hyphen: library for hyphenation and justification')
#	pkgdesc="Interlingua hyphenation rules"
#
#	cd "$srcdir/dictionaries"
#	install -d -m 755 "$pkgdir/usr/share/hyphen"
#	install -m 644 hyph_ia.dic "$pkgdir/usr/share/hyphen"
#}

