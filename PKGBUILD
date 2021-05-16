# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=ognibuild
pkgver=0.0.6
pkgrel=1
pkgdesc="Detect and invoke build systems"
arch=('any')
url="https://github.com/jelmer/ognibuild"
license=('GPL2')
depends=('breezy' 'dpkg' 'python-apt' 'python-buildlog-consultant' 'python-debian'
         'python-requirements-parser')
makedepends=('python-setuptools')
#checkdepends=('python-debmutate' 'python-testtools')
optdepends=('python-debmutate')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('81fba45bf0f66ec0be188e84646b62af149c7b215ce637b6271a27563e17b115')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

#check() {
#	cd "$pkgname-$pkgver"
#	python setup.py test
#}

package() {
	cd "$pkgname-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
