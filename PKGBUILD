# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Wesley Aptekar-Cassels <W.Aptekar@gmail.com>
# Contributor: Lauri Niskanen <ape@ape3000.com>

pkgname=python-ioctl-opt-git
pkgver=0.7.b8a4d84
pkgrel=1
pkgdesc="ioctl opt arguments for Python 3"
arch=('any')
url="https://github.com/vpelletier/python-ioctl-opt"
license=('GPL2')
depends=('python-setuptools')
makedepends=('git')
source=("${pkgname%}::git+https://github.com/vpelletier/python-ioctl-opt")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}"/${pkgname}
        echo "0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    }

package() { 
	cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1
}
