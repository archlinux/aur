# Maintainer: Franek Madej <franek.madej@gmail.com>

pkgname=python-pyvirtualdisplay
_pkgname=PyVirtualDisplay
pkgver=0.2.1
pkgrel=1
pkgdesc='Python wrapper for Xvfb, Xephyr and Xvnc'
url='https://github.com/ponty/pyvirtualdisplay'
arch=('any')
license=('Apache')
depends=('python>=2.7', 'python-easyprocess')
source=("https://pypi.python.org/packages/39/37/f285403a09cc261c56b6574baace1bdcf4b8c7428c8a7239cbba137bc0eb/PyVirtualDisplay-0.2.1.tar.gz")
sha256sums=('012883851a992f9c53f0dc6a512765a95cf241bdb734af79e6bdfef95c6e9982')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

