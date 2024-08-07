# Maintainer: Olga Smirnova <mistresssilvara@hotmail.com>

pkgname='hunspell-ia'
#pkgbase='hunspell-ia'
#pkgname=('hunspell-ia' 'hyphen-ia')
pkgver=20240316
pkgrel=1
pkgdesc="Interlingua hunspell dictionary"
arch=('any')
url="https://addons.mozilla.org/en-us/firefox/addon/dict-ia"
license=('GPL3')
optdepends=('hunspell: the spell checking libraries and apps')
source=("${pkgname}-${pkgver}.zip::https://addons.mozilla.org/firefox/downloads/file/4251079/dict_ia-2024.3.16.xpi")
sha1sums=('0aa2416c7bee11353220ac6c8823ad95eb54cbff')
sha256sums=('6a896fb83d1bb492bc6f4c49304b31e9d335f7171e95fc5fdbf90c1caf7d5c8b')

package() {
	cd "$srcdir/dictionaries"
	install -d -m 755 "$pkgdir/usr/share/hunspell"
	install -m 644 ia.{aff,dic} "$pkgdir/usr/share/hunspell"

	install -d -m 755 "$pkgdir/usr/share/doc/$pkgname"
	cp "../README_dict-ia.txt" README
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

