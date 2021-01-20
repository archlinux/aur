# Maintainer: Francisco Salces Carcoba <pacosalces@gmail.com>
pkgname=python-physunits
_name=physunits
pkgver=0.0.10
pkgrel=1
pkgdesc="Physical units as global variables for simple numerical propagation"
license=("MIT")
url="https://pypi.org/project/physunits/"
makedepends=('python-setuptools')
depends=('python-numpy')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9c2e55de25a3d6690312ed300b061c57d392121d4fd79b40b91e2def5fff29cf')
arch=('any')

build() {
	cd "$srcdir"/${_name}-$pkgver
	python setup.py build
}

package() {
	cd "$srcdir"/${_name}-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build 
	install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
