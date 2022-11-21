# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python38-flask-cors
pkgver=3.0.10
pkgrel=3

pkgdesc='A Flask extension adding a decorator for CORS support'
url='https://pypi.org/project/Flask-Cors'
arch=('any')
license=('MIT')

depends=('python38-flask' 'python38-six')
makedepends=('python38-setuptools')
checkdepends=('python38-nose')

source=("https://pypi.org/packages/source/F/Flask-Cors/Flask-Cors-$pkgver.tar.gz")

sha256sums=('b60839393f3b84a0f3746f6cdca56c1ad7426aa738b70d6c61375857823181de')

build() {
	cd Flask-Cors-$pkgver
	python3.8 setup.py build
}

check() {
	cd Flask-Cors-$pkgver
	python3.8 setup.py test
}

package() {
	cd Flask-Cors-$pkgver
	python3.8 setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm655 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
