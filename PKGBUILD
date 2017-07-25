# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-minimap
pkgver=1.2
pkgrel=1
pkgdesc="Minimap for emacs"
arch=(any)
url="http://www.emacswiki.org/emacs/MiniMap"
license=('GPL')
depends=('emacs')
source=("$pkgname-$pkgver.zip::https://github.com/dengste/minimap/archive/master.zip")
md5sums=('6d87f14e55833af30e2354441c969ea9')

build() {
	cd "$srcdir/minimap-master"
	emacs -batch -f batch-byte-compile *.el
}

package() {
	cd "$srcdir/minimap-master"
	install -dm0755 $pkgdir/usr/share/emacs/site-lisp
	cp *.el{,c} $pkgdir/usr/share/emacs/site-lisp/
}
