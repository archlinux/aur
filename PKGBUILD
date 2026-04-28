# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Conributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-branca
_pkgname=branca
pkgver=0.8.2
pkgrel=1
pkgdesc="Generate html+js with Python."
arch=('any')
url="https://github.com/python-visualization/branca"
license=('MIT')
checkdepends=('jupyter-nbconvert' 'python-nose' 'python-selenium' 'geckodriver')
depends=('python' 'python-jinja' 'python-pandas' 'python-numpy')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/32/14/\
9d409124bda3f4ab7af3802aba07181d1fd56aa96cc4b999faea6a27a0d2/branca-0.8.2.tar.gz")
#("https://files.pythonhosted.org/packages/e8/1d/\
#bec5cb6669b7bf98b632b20bbbb25200bdc44298e7a39d588b0028a78300/branca-0.8.1.tar.gz")
#https://github.com/python-visualization/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")

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
md5sums=('4cd6acd79ce1de68d973440e8ea5668f')
sha256sums=('e5040f4c286e973658c27de9225c1a5a7356dd0702a7c8d84c0f0dfbde388fe7')
