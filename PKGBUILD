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
sha256sums=('fe7a57c596b8d2469db10373b91c4b5ee18b09aa633bb65ba3adb4dedb22dd9b')

build() {
	cd pytube-$pkgver
	python setup.py build
}

package() {
	cd pytube-$pkgver
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
