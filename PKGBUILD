# Maintainer: Ron B.S <ronthecookie0101 on gmail --OR-- me AT ronthecookie DOT me >

pkgname=python-pytube
pkgver=10.6.0
pkgrel=1
pkgdesc="A lightweight, dependency-free Python library (and command-line utility) for downloading YouTube Videos."
arch=('any')
url="https://github.com/pytube/pytube"
license=('MIT')
depends=('python-setuptools' 'python-typing_extensions')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pytube/pytube/archive/v$pkgver.tar.gz")
sha256sums=('8ea8704cd4dfb0a1d8057dbf34f562d49d2e3591b4bebaafc7dbbc66646f4e45')

build() {
	cd pytube-$pkgver
	python setup.py build
}

package() {
	cd pytube-$pkgver
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
