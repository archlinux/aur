# Maintainer: Patrick Lühne <patrick-arch@luehne.de>

pkgname=python-miio
pkgver=0.4.3
pkgrel=1
pkgdesc="Python library & console tool for controlling Xiaomi smart appliances"
url="https://github.com/rytilahti/python-miio"
arch=('any')
license=('GPL3')
depends=('python>=3.5' 'python-android-backup-tools' 'python-appdirs' 'python-attrs' 'python-click' 'python-construct' 'python-cryptography' 'python-netifaces' 'python-pretty-cron' 'python-pytz' 'python-tqdm' 'python-zeroconf')
source=("https://github.com/rytilahti/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('2f7b1cd801dd283b7dde8c97eae76383b087e228dd27b4b3cd972d4e791c7657e9d985ced387633e1e923e4e7302b0462232f69ddecf428843b0dfb4f2589505')

build() {
	cd ${pkgname}-${pkgver}
	python setup.py build
}

package() {
	cd ${pkgname}-${pkgver}
	python setup.py install --prefix=/usr --root="${pkgdir}"
	install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
