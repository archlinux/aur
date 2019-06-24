pkgname=wps-office-dictionary-pt_pt
pkgver=1
pkgrel=1
pkgdesc='Portuguese dictionary for WPS Office'
arch=('any')
url='http://natura.di.uminho.pt/download/sources/Dictionaries/hunspell/'
license=('GPL' 'LGPL' 'MPL')
depends=('wps-office' 'hunspell-pt_pt')
conflicts=('wps-office-extension-portuguese-dictionary')
groups=('wps-office-dictionaries')
source=("dict.conf")
sha256sums=('ae3703630cde429ee8d7fadd0981a37b67c856bbb5847b98d2d6f6bfc4ddd213')

package() {
	install -Dm644 "${srcdir}/dict.conf" -t "$pkgdir/usr/lib/office6/dicts/spellcheck/pt_PT/"

	for ext in "aff" "dic"; do
		ln -s "/usr/share/hunspell/pt_PT.$ext" "$pkgdir/usr/lib/office6/dicts/spellcheck/pt_PT/main.$ext"
	done
}
