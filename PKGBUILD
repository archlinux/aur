# Maintainer: insmtr <insmtr@insmtr.cn>

pkgname=python-ros-genmsg
pkgver=dev
pkgrel=1
pkgdesc='Standalone Python library for generating ROS message and service data structures for various languages'
arch=('any')
url='https://github.com/ros/genmsg'
license=('Apache-2.0')
depends=('python' 'python-setuptools')
makedepends=('python-setuptools')

source=("$pkgname::git+https://github.com/ros/genmsg")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
