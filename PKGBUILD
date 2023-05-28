# Maintainer: Paul Irofti <paul@irofti.net>
_name=free_proxy
pkgname=python-$_name
pkgver=1.1.1
pkgrel=1
pkgdesc="Proxy scraper for further use"
arch=('any')
url="https://github.com/jundymek/free-proxy"
license=('MIT')
depends=('python' 'python-requests' 'python-lxml')
provides=('python-free_proxy')
conflicts=('python-free_proxy')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2b20eb863972b42984292cee17132f4c9ddb8fef0a9bee9bc15215a08e6899fb')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
