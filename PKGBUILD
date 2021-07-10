# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=python-nerd-color
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple CLI colorizer"
arch=('any')
url="https://github.com/0xharu/nerd-color"
license=('GPL3')
depends=('python3')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/N/Nerd-Color/Nerd-Color-$pkgver.tar.gz")
sha256sums=('7e234e89ee016cf5a592cc8cf8e01c1ed42eae3c38b82236e18525180b4a2864')

build() {
	cd "Nerd-Color-$pkgver"
	python setup.py build
}

package() {
	cd "Nerd-Color-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
