# Maintainer: Paul Irofti <paul@irofti.net>
_name=free_proxy
pkgname=python-$_name
pkgver=1.0.2
pkgrel=2
pkgdesc="Proxy scraper for further use"
arch=('any')
url="https://github.com/jundymek/free-proxy"
license=('MIT')
depends=('python' 'python-requests' 'python-lxml')
provides=('python-free_proxy')
conflicts=('python-free_proxy')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('91b667cc89686139695db85b926bcfad4ca1f07a3e0209359182b4f744f425b2')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
