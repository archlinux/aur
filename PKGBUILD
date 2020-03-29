# Maintainer: Patrick Lühne <patrick-arch@luehne.de>

pkgname=python-miio
pkgver=0.5.0
pkgrel=1
pkgdesc="Python library & console tool for controlling Xiaomi smart appliances"
url="https://github.com/rytilahti/python-miio"
arch=('any')
license=('GPL3')
depends=('python>=3.6' 'python-appdirs' 'python-attrs' 'python-click>=7' 'python-construct' 'python-cryptography' 'python-netifaces' 'python-pytz' 'python-tqdm' 'python-zeroconf')
optdepends=('python-android-backup-tools: Android backup extraction support')
source=("https://github.com/rytilahti/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('a603aa0e170d1f0a7d12fa5f6c0b68d212203fc421bd8d5178c6397f7ffdf80f691ec57878fabd271186fc447ee25b0a28761742e124bd6a1064e84add19753e')

build() {
	cd ${pkgname}-${pkgver}
	python setup.py build
}

package() {
	cd ${pkgname}-${pkgver}
	python setup.py install --prefix=/usr --root="${pkgdir}"
	install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
