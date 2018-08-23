# Maintainer: Patrick Lühne <patrick-arch@luehne.de>

_name=android-backup-tools
pkgname=python-${_name}
pkgver=0.2.0
pkgrel=1
pkgdesc="Unpack and repack android backups"
url="https://github.com/bluec0re/android-backup-tools"
arch=('any')
license=('apache')
depends=('python')
source=("https://github.com/bluec0re/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('ac706ed3b79bd110c40932e13adfa1353f4614ca137ab99bcdf35324eca9c3b38821bcf7d9cc4d9c53807dc1f4ea6508d615e887c77b8c6155860d8888c6870b')

build() {
	cd ${_name}-${pkgver}
	python setup.py build
}

package() {
	cd ${_name}-${pkgver}
	python setup.py install --prefix=/usr --root="${pkgdir}"
	install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
