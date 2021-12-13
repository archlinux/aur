# Maintainer: Xeonacid <h.dwwwwww at gmail dot com>

pkgname=python-nampa
_pkgname="${pkgname#*-}"
pkgver=0.1.1
pkgrel=1
pkgdesc="FLIRT signatures for python"
arch=('any')
url="https://github.com/thebabush/nampa"
license=('LGPL')
depends=('python-future')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('6d436100026d408f8f29b3ae12584205d382ab646be1073120755eea9ec0cc4c')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
