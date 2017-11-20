# Maintainer: Patrick Lühne <patrick-arch@luehne.de>

pkgname=python-miio
pkgver=0.3.2
pkgrel=1
pkgdesc="Python library & console tool for controlling Xiaomi smart appliances"
url="https://github.com/rytilahti/python-miio"
arch=('any')
license=('GPL3')
depends=('python>=3.4' 'python-android-backup-tools' 'python-attrs' 'python-click' 'python-construct' 'python-cryptography' 'python-pycryptodomex' 'python-pretty-cron' 'python-pytz' 'python-zeroconf')
source=("https://github.com/rytilahti/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('9c84b6b431c3e0a6a8873fd1fe00d04604dfbb870fc25044a07dff5cfa1e2c32dcfc66ce18e8a1537173271d4985ea5f01037f3ccc7c9d7259bceda037472a95')

build() {
	cd ${pkgname}-${pkgver}
	python setup.py build
}

package() {
	cd ${pkgname}-${pkgver}
	python setup.py install --prefix=/usr --root="${pkgdir}"
}
