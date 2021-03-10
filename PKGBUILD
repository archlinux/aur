# Maintainer: Xeonacid <h.dwwwwww at gmail dot com>

pkgname=python-pwnscripts
_pkgname="${pkgname#*-}"
pkgver=0.6.0
pkgrel=1
pkgdesc="Simple pwntools QoL scripts"
arch=('any')
url="https://github.com/152334H/pwnscripts"
license=('GPL3')
depends=('python-pwntools')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('36d2b751f1a3bfdb8010fab14174b2a9d24f733635dda9b76f4e102466fc4876')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
