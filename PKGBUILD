# Maintainer: Patrick Lühne <patrick-arch@luehne.de>

pkgname=python-miio
pkgver=0.4.5
pkgrel=1
pkgdesc="Python library & console tool for controlling Xiaomi smart appliances"
url="https://github.com/rytilahti/python-miio"
arch=('any')
license=('GPL3')
depends=('python>=3.5' 'python-android-backup-tools' 'python-appdirs' 'python-attrs' 'python-click' 'python-construct' 'python-cryptography' 'python-netifaces' 'python-pretty-cron' 'python-pytz' 'python-tqdm' 'python-zeroconf')
source=("https://github.com/rytilahti/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('e1ec2bbbcf00035710fd114973406221ac506fe6ac16c3099b8142a40d855ffda68191ad934840c31a70d4c11eef8f562cf294a1c7d0df8bb20f9e8cce6ca78a')

build() {
	cd ${pkgname}-${pkgver}
	python setup.py build
}

package() {
	cd ${pkgname}-${pkgver}
	python setup.py install --prefix=/usr --root="${pkgdir}"
	install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
