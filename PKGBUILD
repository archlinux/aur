# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Conributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-branca
_pkgname=branca
pkgver=0.8.0
_pkgver=0.7.2
pkgrel=1
pkgdesc="Generate html+js with Python."
arch=('any')
url="https://github.com/python-visualization/branca"
license=('MIT')
checkdepends=('jupyter-nbconvert' 'python-nose' 'python-selenium' 'geckodriver')
depends=('python' 'python-jinja' 'python-pandas' 'python-numpy')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/6f/45/\
9d999699e3dd6d29b20ee92fb48f3edd76325684690bc9c6881f6eab2857/branca-0.7.2.tar.gz")
#:https://github.com/python-visualization/$_pkgname/archive/refs/tags/v$pkgver.tar.gz

check() {
	cd "$_pkgname-$_pkgver"
	nosetests
}

prepare() {
	cd "$_pkgname-$_pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$_pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
md5sums=('7761ad73417d30cda74bf9e25ea87b28')
sha256sums=('ca4c94643ef31b819987ca5bd19c6009ea17b440baa3aac04628545f7a4da023')
