# Maintainer: Patrick Lühne <patrick-arch@luehne.de>

pkgname=python-miio
pkgver=0.4.8
pkgrel=1
pkgdesc="Python library & console tool for controlling Xiaomi smart appliances"
url="https://github.com/rytilahti/python-miio"
arch=('any')
license=('GPL3')
depends=('python>=3.6' 'python-appdirs' 'python-attrs' 'python-click>=7' 'python-construct' 'python-cryptography' 'python-netifaces' 'python-pytz' 'python-tqdm' 'python-zeroconf')
optdepends=('python-android-backup-tools: Android backup extraction support')
source=("https://github.com/rytilahti/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('630b62f545e77a770957ab8b9f678eb4d6e6a82f0af7b56f11daeca30051bac0d9ef9abc89213f429c16c0112b8c97ff03408f39fe312066fac5feb53278eed5')

build() {
	cd ${pkgname}-${pkgver}
	python setup.py build
}

package() {
	cd ${pkgname}-${pkgver}
	python setup.py install --prefix=/usr --root="${pkgdir}"
	install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
