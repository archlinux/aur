# Maintainer: Narthorn <narthorn@gmail.com>

_pkgname=termdown
pkgname=$_pkgname-git
pkgver=1.18.0.r8.g4c6144c
pkgrel=1
arch=('any')
pkgdesc='Countdown timer and stopwatch in your terminal'
url='https://github.com/trehn/termdown'
license=('GPL3')
makedepends=('git' 'python-setuptools')
depends=('python' 'python-pillow' 'python-art' 'python-dateutil')
optdepends=('espeak: voice support for spoken countdowns')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd $_pkgname
	python setup.py install --root="$pkgdir/"
}
