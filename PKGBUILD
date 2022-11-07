# Maintainer: éclairevoyant
_pkgname=pympv
pkgname=python-$_pkgname
pkgver=0.7.1
pkgrel=1
pkgdesc='A python wrapper for libmpv'
arch=('x86_64')
url='https://github.com/marcan/pympv'
license=('GPL3')
depends=('mpv' 'python')
makedepends=('cython' 'python-setuptools')
conflicts=('python-mpv' 'python-mpv-git' 'python-pympv-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/marcan/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
validpgpkeys=('86F34540412F345D65819BD58E60A76DDEF26276') # Hector Martin <marcan at marcan dot st>
sha256sums=('1d262e7fb2531d27633bdc2334fbc1c3ce094457a6a8f3cfc1c6c9799c1ef202')

build() {
	cd $_pkgname-$pkgver
	python setup.py build
}

package() {
	cd $_pkgname-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
