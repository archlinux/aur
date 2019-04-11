# Maintainer: Ron B.S <ronthecookie0101 on gmail --OR-- me AT ronthecookie DOT me >

pkgname=python-pytube
pkgver=9.4.0
pkgrel=1
pkgdesc="A lightweight, dependency-free Python library (and command-line utility) for downloading YouTube Videos."
arch=('any')
url="https://github.com/nficano/pytube"
license=('MIT')
deps=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nficano/pytube/archive/v$pkgver.tar.gz")
sha256sums=('6bcf9078c324a9f99ac134da17a1dc678ba49813bab5b1059a8b7e23acf3db63')

build() {
	cd pytube-$pkgver
	python setup.py build
}

package() {
	cd pytube-$pkgver
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
