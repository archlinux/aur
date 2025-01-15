pkgname=dottorrent-gui
pkgver=1.3.11
pkgrel=3
arch=('x86_64')
url='https://github.com/kz26/dottorrent-gui'
license=('GPL3')
depends=('python' 'python-humanfriendly' 'python-pyqt5' 'python-pyqt5-sip' 'python-bencoder-pyx' 'python-dottorrent' 'hicolor-icon-theme')
makedepends=('python-setuptools' 'git')
pkgdesc="An advanced GUI torrent file creator with batch functionality, powered by PyQt and dottorrent"
source=("$pkgname-$pkgver::git+https://github.com/kz26/dottorrent-gui#tag=v$pkgver"
		"https://cdn-icons-png.flaticon.com/512/28/28969.png"
		"Dottorrent.desktop")
sha256sums=('2b9746a4acee9ce01f5169c4337bf0965cc78a5995f3dabc206cd7952b302a7a'
            'd52667485a2ca1cdbbad4895f0ca833e25463a9647c67cc1bd0c676733fb3289'
            '24dc0e1f36d8c9351cd0eb9c3bab1f1b54b2587daccf0caeebb3971180ace40a')

build() {
	cd $pkgname-$pkgver
	python setup.py build
}

package() {
	cd $pkgname-$pkgver
	python setup.py install --root="$pkgdir"
	install -Dm755 $srcdir/Dottorrent.desktop -t $pkgdir/usr/share/applications
	install -Dm644 $srcdir/28969.png $pkgdir/usr/share/hicolor/512x512/apps/dottorrent-gui.png
}
