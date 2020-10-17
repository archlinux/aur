# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
_pkgname=python-v4l2
pkgname=${_pkgname}_antmicro
pkgver=0.2
pkgrel=1
pkgdesc="Python v4l2 with antmicro's patches"
arch=('any')
url="https://github.com/antmicro/python3-v4l2"
license=('GPL2')
provides=("python-v4l2")
conflicts=("python-v4l2")
depends=('python')
source=("python-v4l2::git+https://github.com/antmicro/python3-v4l2#commit=eefd091")
sha256sums=("SKIP")

build() {
	cd "$srcdir/$_pkgname"
	python3 setup.py build
}

package() {
	cd "$srcdir/$_pkgname"
	python3 setup.py install --root=$pkgdir --optimize=1 --skip-build
}
