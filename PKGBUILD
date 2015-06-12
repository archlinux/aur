# Maintainer: Lara Maia <lara@craft.net.br>
pkgname=pasteall
pkgver=0.3
url=https://github.com/LaraCraft93/Pasteall
pkgrel=4
pkgdesc='A clipboard monitor simple and functional'
arch=(any)
license=('GPL')
depends=('python2' 'libnotify' 'pygtk' 'python2-gobject2' 'python2-notify')
makedepends=('python2-distribute')
source=('https://github.com/LaraCraft93/Pasteall/tarball/v0.3'
        'pasteall.desktop')
md5sums=('0e68d8aaea6bd4360f0e582334fdd29c'
         'f4f74be5aaecdc10e5e209d3ff7442f8')

build() {
	cd "$srcdir"/LaraCraft93-Pasteall-b4b0ef1
	python2 setup.py build
}

package() {
	cd "$srcdir"/LaraCraft93-Pasteall-b4b0ef1
	python2 setup.py install --root="$pkgdir" --optimize=1
	install -dm755 "$pkgdir"/usr/share/applications/
	install -Dm644 "$srcdir"/pasteall.desktop "$pkgdir"/usr/share/applications/pasteall.desktop
}
