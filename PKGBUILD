# Maintainer: Techmeology <techmeology@techmeology.co.uk>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=pcpp
pkgname=python-$_name
pkgver=1.30
pkgrel=1
pkgdesc='A C99 preprocessor with partial preprocessing capabilities writen in Python'
arch=('any')
url="https://github.com/ned14/$_name"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5af9fbce55f136d7931ae915fae03c34030a3b36c496e72d9636cedc8e2543a1')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
