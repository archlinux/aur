# Maintainer: éclairevoyant

_pkgname=pympv
pkgname="python-$_pkgname"
pkgver=0.7.1
pkgrel=1
pkgdesc='Python wrapper for libmpv'
arch=('x86_64')
url="https://github.com/marcan/$_pkgname"
license=('GPL3')
depends=('mpv' 'python')
makedepends=('cython' 'python-setuptools')
conflicts=('python-mpv')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('57f9f0dbbf8d14714729642f0a646c0e9227134057b30c73c377c598c4c0b6e56147ec5a6ccc980e8b223775edd31072c2842f3d249a3698db5e83bbdc3f05ef')

build() {
	cd $_pkgname-$pkgver
	python setup.py build
}

package() {
	cd $_pkgname-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
