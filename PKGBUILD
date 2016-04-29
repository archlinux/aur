# Maintainer: Fernando Manfredi <contact at acidhub.click>
# Contributor: Lara Maia <lara@craft.net.br>

pkgname=pasteall
pkgver=0.3
url=https://github.com/ShyPixie/Pasteall
pkgrel=5
pkgdesc='A clipboard monitor simple and functional'
arch=(any)
license=('GPL')
depends=('python2' 'libnotify' 'pygtk' 'python2-gobject2' 'python2-notify' 'python2-gconf')
makedepends=('python2-distribute')
source=("https://github.com/ShyPixie/Pasteall/archive/v$pkgver.tar.gz"
        'pasteall.desktop')
md5sums=('b759497a6fca42de06c08064c0df60e2'
         'f4f74be5aaecdc10e5e209d3ff7442f8')

build() {
	cd "$srcdir"/Pasteall-$pkgver
	python2 setup.py build
}

package() {
	cd "$srcdir"/Pasteall-$pkgver
	python2 setup.py install --root="$pkgdir" --optimize=1
	install -dm755 "$pkgdir"/usr/share/applications/
	install -Dm644 "$srcdir"/pasteall.desktop "$pkgdir"/usr/share/applications/pasteall.desktop
}
