pkgname=python-dottorrent-gui
_pkgname=dottorrent-gui
pkgver=1.3.11
pkgrel=1
arch=('x86_64')
url='https://github.com/kz26/dottorrent-gui'
license=('GPL3')
depends=('python' 'python-humanfriendly' 'python-pyqt5' 'python-pyqt5-sip' 'python-bencoder-pyx' 'python-dottorrent')
makedepends=('python-setuptools' 'git')
source=("$_pkgname-$pkgver::git+https://github.com/kz26/dottorrent-gui#tag=v$pkgver")
sha256sums=('2b9746a4acee9ce01f5169c4337bf0965cc78a5995f3dabc206cd7952b302a7a')

build() {
	cd $_pkgname-$pkgver
	python setup.py build
}

package() {
	cd $_pkgname-$pkgver
	python setup.py install --root="$pkgdir"
}
