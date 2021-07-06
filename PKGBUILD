# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Ron B.S <ronthecookie0101 on gmail --OR-- me AT ronthecookie DOT me >

pkgname=python-pytube
pkgver=10.9.0
pkgrel=1
pkgdesc="A lightweight, dependency-free Python library (and command-line utility) for downloading YouTube Videos."
arch=('any')
url="https://github.com/pytube/pytube"
license=('MIT')
depends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pytube/pytube/archive/v$pkgver.tar.gz")
sha256sums=('38c3b00c856d0a74aa8420d7ae61c50b17c7772e0b26c031c62495c19a60459a')

build() {
	cd pytube-$pkgver
	python setup.py build
}

package() {
	cd pytube-$pkgver
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
