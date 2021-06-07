# Maintainer: Patrick Lühne <patrick-arch@luehne.de>

pkgname=python-miio
pkgver=0.5.6
pkgrel=1
pkgdesc="Python library & console tool for controlling Xiaomi smart appliances"
url="https://github.com/rytilahti/python-miio"
arch=('any')
license=('GPL3')
depends=('python>=3.6' 'python-appdirs' 'python-attrs' 'python-click>=7' 'python-construct' 'python-cryptography' 'python-netifaces' 'python-pytz' 'python-tqdm' 'python-zeroconf')
optdepends=('python-android-backup-tools: Android backup extraction support')
source=("https://github.com/rytilahti/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('f8ebe9a37a12bb58f86014347af0dfda74cb973e41faa60a86bf927dc229f0298a576ee7969f3754f285a1f97231d3a6d43f242dfec73b1f617579b6a8af7506')

build() {
	cd ${pkgname}-${pkgver}
	python setup.py build
}

package() {
	cd ${pkgname}-${pkgver}
	python setup.py install --prefix=/usr --root="${pkgdir}"
	install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
