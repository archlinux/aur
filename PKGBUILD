# Maintainer: Ron B.S <ronthecookie0101 on gmail --OR-- me AT ronthecookie DOT me >

pkgname=python-pytube
pkgver=10.5.2
pkgrel=1
pkgdesc="A lightweight, dependency-free Python library (and command-line utility) for downloading YouTube Videos."
arch=('any')
url="https://github.com/pytube/pytube"
license=('MIT')
depends=('python-setuptools' 'python-typing_extensions')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pytube/pytube/archive/v$pkgver.tar.gz")
sha256sums=('faf069163b0f74a8f8a3827dab0ef081824bde2c713daec91c23df54e93f8a6a')

build() {
	cd pytube-$pkgver
	python setup.py build
}

package() {
	cd pytube-$pkgver
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
