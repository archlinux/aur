# Maintainer: Xeonacid <h.dwwwwww at gmail dot com>

pkgname=python-ancypwn-backend-unix
_pkgname="${pkgname#*-}"
pkgver=0.0.2
pkgrel=1
pkgdesc="ancypwn unix universal backend"
arch=('any')
url="https://github.com/Escapingbug/ancypwn-backend-unix"
license=('unknown')
depends=('python-docker' 'python-appdirs' 'python-daemonize')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('caa5c8dd483600ef53cb23a361b74f4cb2ddff3df03c0a417488c7fbeef90207')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
