# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=python-freenom
pkgver=0.0.2
pkgrel=1
pkgdesc="Unofficial Python implementation of Freenom API for managing DNS records"
arch=('any')
url="https://github.com/Shm013/freenom-dns"
license=('MIT')
depends=('python' 'python-requests' 'python-lxml' 'python-retrying')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/f/freenom/freenom-$pkgver.tar.gz")
sha256sums=('676dbacc5aa2a45c34db359f2497d1dd329ceb30e3bf9d57d795290328cbcd14')

build() {
	cd freenom-$pkgver
	python setup.py build
}

package() {
	cd freenom-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
