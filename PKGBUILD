# Maintainer: Bruce Zhang <zttt183525594 [at] gmail [dot] com>
pkgname=fastocr
_reponame=FastOCR
pkgver=0.1.4
pkgrel=1
pkgdesc='FastOCR is a desktop application for OCR API.'
arch=('any')
url='https://github.com/BruceZhang1993/FastOCR'
license=('LGPL3')
depends=('python-pyqt5' 'python-qasync' 'python-aiohttp' 'python-dbus' 'python-click')
makedepends=('python-setuptools')
provides=('fastocr')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/BruceZhang1993/FastOCR/archive/$pkgver.tar.gz")
sha256sums=('cfdb400c2f62eb11788d0400a2d9fbdbb4407e05e45de2f01d8c3b10ab6399f3')

build() {
	cd "$srcdir/$_reponame-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_reponame-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 fastocr/data/FastOCR.desktop "$pkgdir/usr/share/applications/FastOCR.desktop"
}
