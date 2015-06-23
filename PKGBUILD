# Maintainer: John Jenkins twodopeshaggy@gmail.com
# Contributer: Lauri Niskanen <ape@ape3000.com>

pkgname=python-hidraw-git
pkgver=r4.bbd7855
pkgrel=1
pkgdesc="Pythonic bindings for linux's hidraw ioctls"
arch=('any')
url="https://github.com/vpelletier/python-hidraw"
license=('GPL2')
depends=('python-setuptools' 'python-ioctl-opt-git')
makedepends=('git')
source=("$pkgname::git+https://github.com/vpelletier/python-hidraw.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}"/${pkgname}
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    }

package() { 
	cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1
}
