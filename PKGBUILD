# Contributor: Anton Leontiev <scileont /at/ gmail.com>
pkgname=asciidoc-gtk-highlight
pkgver=0.2
pkgrel=1
pkgdesc='AsciiDoc syntax highlight for gtksourceview'
arch=('any')
url='https://launchpad.net/asciidoc-gtk-highlight'
license=('LGPL')
source=(https://launchpad.net/$pkgname/trunk/release$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('76415aad0c3302241fef9c7d1cb90a75')

package() {
	cd $pkgname-$pkgver
	install -m644 -D asciidoc.lang "$pkgdir"/usr/share/gtksourceview-2.0/language-specs/asciidoc.lang
	install -m755 -d "$pkgdir"/usr/share/gtksourceview-3.0/language-specs
	ln "$pkgdir"/usr/share/gtksourceview-{2,3}.0/language-specs/asciidoc.lang
}
