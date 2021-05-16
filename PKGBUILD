# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=ognibuild
pkgver=0.0.5
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
sha256sums=('23cd56a966fb7263bf3aad232dc49b593deb96eef21e76b1f8587fa8892136d0')

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
