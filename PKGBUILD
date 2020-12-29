# Maintainer: Srevin Saju <srevinsaju@sugarlabs.org>
pkgname=python-gwebsockets-git
pkgver=v0.7
pkgrel=5
pkgdesc="A websocket server written in Python"
arch=('any')
url="https://github.com/sugarlabs/gwebsockets"
license=('Apache-2.0')
makedepends=('python-setuptools')
source=("git+https://github.com/sugarlabs/gwebsockets.git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
sha256sums=('SKIP')



build() {
	cd "$srcdir/gwebsockets"
	python setup.py build
}

package() {
	cd "$srcdir/gwebsockets"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
