# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Ron B.S <ronthecookie0101 on gmail --OR-- me AT ronthecookie DOT me >

pkgname=python-pytube
pkgver=10.8.4
pkgrel=1
pkgdesc="A lightweight, dependency-free Python library (and command-line utility) for downloading YouTube Videos."
arch=('any')
url="https://github.com/pytube/pytube"
license=('MIT')
depends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pytube/pytube/archive/v$pkgver.tar.gz")
sha256sums=('935cf56babc814aacf7e23460f331aaf59bd1c0c8ef39c10e2a10589c50b6787')

build() {
	cd pytube-$pkgver
	python setup.py build
}

package() {
	cd pytube-$pkgver
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
