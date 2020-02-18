# Maintainer: Dzmitry Kushnarou <dmymd@yandex.by>

pkgname='hunspell-be'
pkgver=0.58.1webext
pkgrel=1
pkgdesc="Belarusian hunspell dictionary (academic orthography)"
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/belarusian-spellcheck-webext/"
license=('CC-BY-SA 3.0')
optdepends=('hunspell: the spell checking libraries and apps')
source=("${pkgname}-${pkgver}.zip::https://addons.mozilla.org/firefox/downloads/file/3362283/belarusian_spellcheck_dictionary-0.58.1webext.xpi")
md5sums=('94c4b63df14d5a53710608a847549505')
sha1sums=('4d540b9a63527943059fe692d5795ed5354d8e11')
sha256sums=('c6790b32db345d2d8064a8d68c253d016ce9c7902f1dc6837a932c6008eb89a2')

package() {
	cd "$srcdir/dictionaries"
	install -d -m 755 "$pkgdir/usr/share/hunspell"
	install -m 644 be_BY.{aff,dic} "$pkgdir/usr/share/hunspell"

	install -d -m 755 "$pkgdir/usr/share/doc/$pkgname"
	cp "README_be_BY.txt" README
	install -m 644 README "$pkgdir/usr/share/doc/$pkgname"
}
