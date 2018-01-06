# Maintainer: Patrick Lühne <patrick-arch@luehne.de>

pkgname=python-miio
pkgver=0.3.3
pkgrel=1
pkgdesc="Python library & console tool for controlling Xiaomi smart appliances"
url="https://github.com/rytilahti/python-miio"
arch=('any')
license=('GPL3')
depends=('python>=3.4' 'python-android-backup-tools' 'python-attrs' 'python-click' 'python-construct' 'python-cryptography' 'python-pycryptodomex' 'python-pretty-cron' 'python-pytz' 'python-zeroconf')
source=("https://github.com/rytilahti/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('e1282294b106cbf773fd5aa9565e78029fd4908242df2a4de6bdd2069a49a591b32469daae894188303a37bdc7bead223abc0b4d92891eb0441e120fab9f37e4')

build() {
	cd ${pkgname}-${pkgver}
	python setup.py build
}

package() {
	cd ${pkgname}-${pkgver}
	python setup.py install --prefix=/usr --root="${pkgdir}"
	install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
