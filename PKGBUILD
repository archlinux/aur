# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Conributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-branca
_pkgname=branca
pkgver=0.7.0
pkgrel=1
pkgdesc="Generate html+js with Python."
arch=('any')
url="https://github.com/python-visualization/branca"
license=('MIT')
checkdepends=('jupyter-nbconvert' 'python-nose' 'python-selenium' 'geckodriver')
depends=('python' 'python-jinja' 'python-pandas' 'python-numpy')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/4e/\
e7/9b78e6f307f8450396081413771c0c0ddccb9ac9e38cad83fbc128428353/branca-0.7.0.tar.gz")
#:https://github.com/python-visualization/$_pkgname/archive/refs/tags/v$pkgver.tar.gz

check() {
	cd "$_pkgname-$pkgver"
	nosetests
}

prepare() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
md5sums=('2273593da514a130a30134aef9c5174a')
sha256sums=('503ccb589a9ee9464cb7b5b17e5ffd8d5082c5c28624197f58f20d4d377a68bb')
