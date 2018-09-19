# Maintainer: Olivier Le Moal <mail@olivierlemoal.fr>
pkgbase=python-pycrate-git
pkgname=('python2-pycrate-git' 'python-pycrate-git')
pkgver=r222.ee66b19
pkgrel=2
pkgdesc="Python library for manipulating various digital formats in an easy way."
arch=(any)
url="https://github.com/P1sec/pycrate"
license=('LGPL2.1')
makedepends=('git')
conflicts=("python-pycrate" "python2-pycrate")
source=('pycrate::git+https://github.com/P1sec/pycrate#branch=master')
md5sums=('SKIP')

pkgver() {
	cd pycrate
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_python-pycrate-git() {
    depends=('python')
    conflicts=("python2-pycrate-git")

    cd pycrate
    python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-pycrate-git() {
    depends=('python2')
    conflicts=("python-pycrate-git")

    cd pycrate
    python2 setup.py install --root="$pkgdir" --optimize=1
}
