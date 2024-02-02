# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Conributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-branca
_pkgname=branca
pkgver=0.7.1
pkgrel=1
pkgdesc="Generate html+js with Python."
arch=('any')
url="https://github.com/python-visualization/branca"
license=('MIT')
checkdepends=('jupyter-nbconvert' 'python-nose' 'python-selenium' 'geckodriver')
depends=('python' 'python-jinja' 'python-pandas' 'python-numpy')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/90/\
b4/e7d37c37da564f44214d89d3616e28d46a77d7a9398a07de7e35f99504c1/branca-0.7.1.tar.gz")
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
md5sums=('d52518650fd52e4451e46b999874c961')
sha256sums=('e6b6f37a37bc0abffd960c68c045a7fe025d628eff87fedf6ab6ca814812110c')
