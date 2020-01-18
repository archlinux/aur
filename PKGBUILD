# Maintainer: Ron B.S <ronthecookie0101 on gmail --OR-- me AT ronthecookie DOT me >

pkgname=python-pytube
pkgver=9.5.1
pkgrel=2
pkgdesc="A lightweight, dependency-free Python library (and command-line utility) for downloading YouTube Videos."
arch=('any')
url="https://github.com/nficano/pytube"
license=('MIT')
depends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nficano/pytube/archive/v$pkgver.tar.gz")
sha256sums=('526413d74621f367a7a8730257244af3f9d3ef514f953d69ce9dbd461ce05446')

build() {
	cd pytube-$pkgver
	python setup.py build
}

package() {
	cd pytube-$pkgver
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
