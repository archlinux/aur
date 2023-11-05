# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Conributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-branca
_pkgname=branca
pkgver=0.6.0
pkgrel=1
pkgdesc="Generate html+js with Python."
arch=('any')
url="https://github.com/python-visualization/branca"
license=('MIT')
checkdepends=('jupyter-nbconvert' 'python-nose' 'python-selenium' 'geckodriver')
depends=('python' 'python-jinja' 'python-pandas' 'python-numpy')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/bb/\
66/e3591bc59d0685668cf9bb451ed527b0c261cfa2afedbe72422442586ace/$_pkgname-$pkgver.tar.gz")

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
md5sums=('b219d8556c040deade38ad9846e45105')
sha256sums=('55949855214504c7583b71b9a03a84dce2e96a84027613bb53b42d04844ce24e')
