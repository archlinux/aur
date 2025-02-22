# Maintainer: Bruce Zhang <zttt183525594 [at] gmail [dot] com>
pkgname=fastocr
_reponame=FastOCR
pkgver=0.3.8
pkgrel=1
pkgdesc='FastOCR is a desktop application for OCR API.'
arch=('any')
url='https://github.com/BruceZhang1993/FastOCR'
license=('LGPL-3.0-or-later')
depends=('python-pyqt6' 'python-qasync' 'python-aiohttp' 'python-dbus' 'python-click' 'qt6-declarative')
makedepends=('python-setuptools')
provides=('fastocr')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/BruceZhang1993/FastOCR/archive/$pkgver.tar.gz")
sha256sums=('017c5c7ff6ba3248b0778fad5c4ad13f222d2c659c31c6fb063429fa7c83a0a6')

build() {
	cd "$srcdir/$_reponame-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_reponame-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 fastocr/data/FastOCR.desktop "$pkgdir/usr/share/applications/FastOCR.desktop"
}
