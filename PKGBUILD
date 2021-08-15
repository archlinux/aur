# Maintainer: Aditya Sirish <aditya@saky.in>

pkgname=rmview
pkgver=2.1
pkgrel=1
pkgdesc="a fast live viewer for reMarkable 1 and 2"
arch=('any')
url="https://github.com/bordaigorl/rmview"
license=('GPL3')
depends=('python' 'python-pyqt5' 'python-paramiko' 'python-twisted')
makedepends=('git' 'python-setuptools')
source=("git+${url}.git#tag=v${pkgver}")
md5sums=('SKIP')
conflicts=('rmview-git')

build() {
	cd "${srcdir}/${pkgname}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}"
	python3 setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

