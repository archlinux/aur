# Maintainer: Adrien Sohier <adrien.sohier@art-software.fr>

pkgname=trash-py
pkgver=1.0
pkgrel=1
pkgdesc='A cli trash in python 3'
arch=('any')
url="http://www.art-software.fr"
license=('GPL')
depends=('coreutils' 'gettext' 'python>=3.4')
source=("Trash.py"
		"en.po"
		"fr.po")

md5sums=('4ad5337338eeff9f0e0429c151faaad6'
         'ded9fa8a6f295d34b11e852c1cd48062'
         'b1b74c67e04ea5ca142075e8256f562f')

build() {
	cd "$srcdir"
	msgfmt en.po -o en.mo
	msgfmt fr.po -o fr.mo
}

package() {
	cd "$srcdir"
	install -Dm644 en.mo "$pkgdir/usr/share/locale/en/LC_MESSAGES/trash.mo"
	install -Dm644 fr.mo "$pkgdir/usr/share/locale/fr/LC_MESSAGES/trash.mo"
	install -Dm755 Trash.py "$pkgdir/usr/bin/trash"
}
