# Maintainer: Autumn Boyhan <autumn@crisismodel.com>

pkgname=python-xsge
_pkgname=xsge
pkgver=2021.10.11
pkgrel=3
pkgdesc="xSGE is a collection of higher-level extensions for the SGE which
enhance the core functionality in an implementation-independent way."
arch=('x86_64')
url="https://python-sge.github.io/"
license=('LGPL')
depends=('python' 'python-pygame-git' 'python-sge')
makedepends=('python-setuptools')
provides=('python-xsge')
conflicts=('python-xsge')
_name=${pkgname#python-}
source=("https://github.com/python-sge/xsge/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('58fb4b439d420f48706e7a3de01de81d')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
