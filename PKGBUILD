# Maintainer: Xeonacid <h.dwwwwww at gmail dot com>

pkgname=python-ancypwn-terminal-alacritty
_pkgname="${pkgname#*-}"
pkgver=0.0.2
pkgrel=1
pkgdesc="ancypwn terminal plugin"
arch=('any')
url="https://github.com/Escapingbug/ancypwn-terminal-alacritty"
license=('unknown')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('47917effdf0218d684008c339743e1a435df21db72c569e4ab1a038fd0edcc56')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
