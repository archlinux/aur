# Maintainer: Patrick Lühne <patrick-arch@luehne.de>

pkgname=python-miio
pkgver=0.4.4
pkgrel=1
pkgdesc="Python library & console tool for controlling Xiaomi smart appliances"
url="https://github.com/rytilahti/python-miio"
arch=('any')
license=('GPL3')
depends=('python>=3.5' 'python-android-backup-tools' 'python-appdirs' 'python-attrs' 'python-click' 'python-construct' 'python-cryptography' 'python-netifaces' 'python-pretty-cron' 'python-pytz' 'python-tqdm' 'python-zeroconf')
source=("https://github.com/rytilahti/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('43c4284addef7a15b49756d8f3f7cf914a806732642f948f104e7d26a4c25324e5dbdea3b93cace7e83c2b9999345065e41a106a4b53cf9749e5d31ea59aa535')

build() {
	cd ${pkgname}-${pkgver}
	python setup.py build
}

package() {
	cd ${pkgname}-${pkgver}
	python setup.py install --prefix=/usr --root="${pkgdir}"
	install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
