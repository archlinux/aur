# Maintainer: Patrick Lühne <patrick-arch@luehne.de>

_name=android-backup-tools
pkgname=python-${_name}-git
pkgver=r7.49fc127
pkgrel=1
pkgdesc="Unpack and repack android backups"
url="https://github.com/bluec0re/android-backup-tools"
arch=('any')
license=('apache')
provides=("python-${_name}")
conflicts=("python-${_name}")
depends=('python')
makedepends=('git')
source=("git://github.com/bluec0re/${_name}.git")
md5sums=('SKIP')

pkgver() {
	cd ${_name}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${_name}
	python setup.py build
}

package() {
	cd ${_name}
	python setup.py install --prefix=/usr --root="${pkgdir}"
}
