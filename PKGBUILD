# Contributor: Florian Klink <flokli at flokli dot de>
pkgname=python-pystache
_pkgname=pystache
pkgver=0.5.4
pkgrel=3
pkgdesc="The mustache template engine written in python"
arch=("any")
url="http://github.com/defunkt/pystache"
license=('MIT')
depends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('f7bbc265fb957b4d6c7c042b336563179444ab313fb93a719759111eabd3b85a')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
