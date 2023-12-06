# Maintainer: Bruce Zhang <zttt183525594 [at] gmail [dot] com>
pkgname=fastocr
_reponame=FastOCR
pkgver=0.3.7
pkgrel=1
pkgdesc='FastOCR is a desktop application for OCR API.'
arch=('any')
url='https://github.com/BruceZhang1993/FastOCR'
license=('LGPL3')
depends=('python-pyqt6' 'python-qasync' 'python-aiohttp' 'python-dbus' 'python-click' 'qt6-quickcontrols2')
makedepends=('python-setuptools')
provides=('fastocr')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/BruceZhang1993/FastOCR/archive/$pkgver.tar.gz")
sha256sums=('3453fcb98bd10e53c5f14663c32e5bf6dcfc2448ece388bdfe6aca919a30ac85')

build() {
	cd "$srcdir/$_reponame-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_reponame-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 fastocr/data/FastOCR.desktop "$pkgdir/usr/share/applications/FastOCR.desktop"
}
