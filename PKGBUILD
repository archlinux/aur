pkgname=python-flask-silk
pkgver=0.2
pkgrel=1
arch=('x86_64')
url='https://github.com/sublee/flask-silk'
license=('custom')
depends=('python' 'python-flask')
makedepends=('python-setuptools' 'git')
pkgdesc="Adds silk icons to your Flask application or module, or extension"
source=("$pkgname-$pkgver::git+https://github.com/sublee/flask-silk")
sha256sums=('SKIP')

build() {
	cd $pkgname-$pkgver
	python setup.py build
}

package() {
	cd $pkgname-$pkgver
	python setup.py install --root="$pkgdir"
	install -Dm644 $srcdir/python-flask-silk-0.2/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
