# Maintainer: Ron B.S <ronthecookie0101 on gmail --OR-- me AT ronthecookie DOT me >

pkgname=python-pytube
pkgver=9.6.4
pkgrel=2
pkgdesc="A lightweight, dependency-free Python library (and command-line utility) for downloading YouTube Videos."
arch=('any')
url="https://github.com/nficano/pytube"
license=('MIT')
depends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nficano/pytube/archive/v$pkgver.tar.gz")
sha256sums=('f9cc6edd4ca019a5518a918b542c3d6f4c4b7f9ea88b4f28d2ac675f75d8bbd8')

build() {
	cd pytube-$pkgver
	python setup.py build
}

package() {
	cd pytube-$pkgver
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
