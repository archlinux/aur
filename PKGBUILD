# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
pkgname=feeluown
pkgver=2.2
pkgrel=2
pkgpath='80/85/14910d675db89f13079f79ece4a237d563d4d50f71d38eae9762d3e65851'
epoch=
pkgdesc="一个符合 Unix 哲学的跨平台的音乐播放器"
arch=('any')
url="https://github.com/cosven/FeelUOwn"
license=('GPL3')
depends=('python-quamash>=0.5.5' 'python-fuocore' 'python-pyqt5')
makedepends=('python-setuptools')
install=feeluown.install
source=("https://files.pythonhosted.org/packages/${pkgpath}/feeluown-${pkgver}.tar.gz")
sha256sums=('0cd607d115b8641c21a4740b3c7646b67a4b6493c76bbc8c1d9110770bba0938')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
