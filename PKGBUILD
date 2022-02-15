# Maintainer: Leonardo Hernández Hernández <leohdz172 [at] protonmail [dot] com>
# Maintainer: Antonio Sarosi <sarosiantonio [at] gmail [dot] com>

pkgname=pycritty
pkgver=0.4.0
pkgrel=1
pkgdesc='CLI program that allows you to change your Alacritty config with one command without editing the config file.'
url='https://github.com/antoniosarosi/pycritty'
arch=('any')
license=('MIT')
depends=('python>=3.6' 'python-yaml' 'alacritty')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('27bbeafe9ec600a66066b7c525ce21584de55267ff93e58ee44a655f7511e399844f37d31f27dc268b7cdb8b2e2eebe19364bbe74578e6b1d23ad77fea61a5ee')

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
