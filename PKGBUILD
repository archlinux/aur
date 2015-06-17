# Maintainer: M0Rf30
# Contributor: Alper KANAT <alperkanat@raptiye.org>

pkgname=loggerhead
pkgver=1.18.1
pkgrel=3
pkgdesc="A web viewer for projects in bazaar."
arch=('i686' 'x86_64')
url="https://launchpad.net/loggerhead"
license=('GPL2')
depends=("python2-simpletal" "python2-paste>=1.2")
makedepends=("python")
optdepends=("python-paste-deploy: needed when proxying through Apache")
source=(http://launchpad.net/loggerhead/1.18/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz)
install=${pkgname}.install

package() {
	_LICENSE_DIR="$pkgdir/usr/share/licenses/$pkgname"
	_DOC_DIR="$pkgdir/usr/share/doc/$pkgname"

	cd ${srcdir}/$pkgname-$pkgver
	python2 setup.py install --root=${pkgdir}

	# copying license file
	mkdir -p $_LICENSE_DIR
	install -m644 COPYING.txt $_LICENSE_DIR

	# copying readme file
	mkdir -p $_DOC_DIR
	install -m644 README $_DOC_DIR
}

md5sums=('bef897d4674967ef835d1183d587d34f')
