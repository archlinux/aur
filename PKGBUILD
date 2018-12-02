# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
pkgname=feeluown
pkgver=2.1.1
pkgrel=2
epoch=
pkgdesc="一个符合 Unix 哲学的跨平台的音乐播放器"
arch=('any')
url="https://github.com/cosven/FeelUOwn"
license=('GPL3')
depends=('python-quamash>=0.5.5' 'python-fuocore' 'python-requests' 'python-pyqt5' 'qt5-multimedia' 'qt5-webkit')
makedepends=('python-setuptools')
install=feeluown.install
source=("https://files.pythonhosted.org/packages/af/3d/5b7b89a00c62b20af9b548107a05b4ac27d29417bd707c6853621a4b2f14/feeluown-${pkgver}.tar.gz")
sha256sums=('d1688978a02c4528fb5cdf3b308661840b0fbb487af0bd84e30a6c382ea391df')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
