# Maintainer: Aditya Sirish <aditya@saky.in>

pkgname=rmview
pkgver=3.0
pkgrel=1
pkgdesc="a fast live viewer for reMarkable 1 and 2"
arch=('any')
url="https://github.com/bordaigorl/rmview"
license=('GPL3')
depends=('python' 'python-pyqt5' 'python-paramiko' 'python-twisted')
makedepends=('git' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3d93f065dce2a251e891ca51a88d6cfc63d2f39f7584b69c66235cfe6b8a76fc')
conflicts=('rmview-git')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python3 setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

