# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=python-debianbts
pkgver=3.2.0
pkgrel=1
pkgdesc="Python library for querying Debian's Bug Tracking System"
arch=('any')
url="https://github.com/venthur/python-debianbts"
license=('MIT')
depends=('python' 'python-pysimplesoap')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('234097d8f18c9baef91fd947f4236ac1701f5d5c07ea4603babee6de14ff7dc6')

build() {
	cd $pkgname-$pkgver
	python setup.py build
}

package() {
	cd $pkgname-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
