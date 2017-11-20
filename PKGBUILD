# Maintainer: Patrick Lühne <patrick-arch@luehne.de>

_name=android-backup-tools
pkgname=python-${_name}
pkgver=0.1.0
pkgrel=1
pkgdesc="Unpack and repack android backups"
url="https://github.com/bluec0re/android-backup-tools"
arch=('any')
license=('apache')
depends=('python')
source=("https://github.com/bluec0re/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('b227f793368e7900e882a0738eaeead184850eda6b9a8a3f9ba7846c93164f5f4bd2fa6abb7101d61bfc54c6e3ddaeb3c105ad1e5a7353a3f9d6c8d560804a8b')

build() {
	cd ${_name}-${pkgver}
	python setup.py build
}

package() {
	cd ${_name}-${pkgver}
	python setup.py install --prefix=/usr --root="${pkgdir}"
	install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
