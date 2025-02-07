# Maintainer: loadept <falcorgd [at] gmail [dot] com>

pkgname=qtheme
pkgver=2.0.6
pkgrel=1
pkgdesc="Tool for management qtile desktop environment"
url='https://github.com/loadept/qtheme'
arch=('any')
license=('MIT')
depends=('python>=3.12' 'qtile' 'kitty' 'fastfetch')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('23a484ea93cdf0586d0843371515ea6148ae502ff21a855aaf047d69d8f427081bab60cfc37c771ba9c2e84bb89c8065ddd532613bdecee7ed8fdc907c88e597')

build() {
	cd $pkgname-$pkgver
	python setup.py build
}

package() {
	cd $pkgname-$pkgver
	python setup.py install --prefix=/usr --root="${pkgdir}" -O1 --skip-build
	install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
	install -Dm 644 README.md -t "${pkgdir}"/usr/share/doc/${pkgname}
}
