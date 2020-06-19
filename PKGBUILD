# Maintainer: Stick <stick@stma.is>

pkgname=python-flask-basicauth
_name=Flask-BasicAuth
pkgver=0.2.0
pkgrel=1
pkgdesc="Protect certain views or your whole application with HTTP basic access authentication"
arch=('any')
url='https://github.com/jpvanhal/flask-basicauth'
license=('BSD')
depends=(
	'python-flask'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('df5ebd489dc0914c224419da059d991eb72988a01cdd4b956d52932ce7d501ff')
provides=("$pkgname")
conflicts=("$pkgname")

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
