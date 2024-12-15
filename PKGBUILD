# Maintainer: Paul Irofti <paul@irofti.net>
_name=free_proxy
pkgname=python-$_name
pkgver=1.1.3
pkgrel=1
pkgdesc="Proxy scraper for further use"
arch=('any')
url="https://github.com/jundymek/free-proxy"
license=('MIT')
depends=('python' 'python-requests' 'python-lxml')
provides=('python-free_proxy')
conflicts=('python-free_proxy')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6d82aa112e3df7725bdbf177e2110bccdf5f3bbd6e1c70b8616ec12ae3bbf98c')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
