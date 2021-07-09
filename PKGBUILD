# Maintainer: Bruce Zhang <zttt183525594 [at] gmail [dot] com>
pkgname=fastocr
_reponame=FastOCR
pkgver=0.3.0
pkgrel=1
pkgdesc='FastOCR is a desktop application for OCR API.'
arch=('any')
url='https://github.com/BruceZhang1993/FastOCR'
license=('LGPL3')
depends=('python-pyqt5' 'python-qasync' 'python-aiohttp' 'python-dbus' 'python-click' 'qt5-quickcontrols2')
makedepends=('python-setuptools')
provides=('fastocr')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/BruceZhang1993/FastOCR/archive/$pkgver.tar.gz")
sha256sums=('951dc04b3c16d617b0e226ad8e61363de7d75f623f7af678d9b4b1467ef5c860')

build() {
	cd "$srcdir/$_reponame-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_reponame-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 fastocr/data/FastOCR.desktop "$pkgdir/usr/share/applications/FastOCR.desktop"
}
