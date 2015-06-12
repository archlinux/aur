pkgname=emacs-minimap
pkgver=20150224
pkgrel=1
pkgdesc="Minimap for emacs"
arch=(any)
url="http://www.emacswiki.org/emacs/MiniMap"
license=('GPL')
depends=(emacs)
source=(git://github.com/dengste/minimap)
md5sums=('SKIP')

build() {
	cd "$srcdir/minimap"
	emacs -batch -f batch-byte-compile *.el
}

package() {
	cd "$srcdir/minimap"
	install -dm0755 $pkgdir/usr/share/emacs/site-lisp
	cp *.el{,c} $pkgdir/usr/share/emacs/site-lisp/
}
