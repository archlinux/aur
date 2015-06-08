# Maintainer: nixi <nixiawoo@gmail.com>
# Contributor: Wesley Aptekar-Cassels <W.Aptekar@gmail.com>
# Contributor: Lauri Niskanen <ape@ape3000.com>

pkgname=python2-ioctl-opt-git
pkgver=4
pkgrel=1
pkgdesc="ioctl opt arguments for Python 2"
arch=('any')
url="https://github.com/vpelletier/python-ioctl-opt"
license=('GPL2')
depends=('python-setuptools')
makedepends=('git')
source=("${pkgname%}::git+https://github.com/vpelletier/python-ioctl-opt")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}"/${pkgname}
	git rev-list --count HEAD
}

package() { 
	cd "$srcdir/$pkgname"
	python2 setup.py install --root="$pkgdir/" --optimize=1
}
