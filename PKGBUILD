# Maintainer: Patrick Lühne <patrick-arch@luehne.de>

pkgname=python-miio
pkgver=0.3.4
pkgrel=1
pkgdesc="Python library & console tool for controlling Xiaomi smart appliances"
url="https://github.com/rytilahti/python-miio"
arch=('any')
license=('GPL3')
depends=('python>=3.4' 'python-android-backup-tools' 'python-attrs' 'python-click' 'python-construct' 'python-cryptography' 'python-pycryptodomex' 'python-pretty-cron' 'python-pytz' 'python-zeroconf')
source=("https://github.com/rytilahti/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('9dfecfee215c2fbb485090400291573154f0e3d625e9f2941044a1ddb3e2f0f30f56f787c639717c99966c59a1cd812ff83ec0f7c188fac93f30336b5c30de04')

build() {
	cd ${pkgname}-${pkgver}
	python setup.py build
}

package() {
	cd ${pkgname}-${pkgver}
	python setup.py install --prefix=/usr --root="${pkgdir}"
	install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
